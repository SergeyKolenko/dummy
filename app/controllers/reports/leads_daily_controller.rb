class Reports::LeadsDailyController < ApplicationController

  def index
    @business_entities = BusinessEntity.all
    @lead_sources = LeadSource.for_select
  end

  def create
    if filter_valid?
      date_from = DateTime.strptime( params[:filter][:date_from], '%m/%d/%Y')
      date_to =  DateTime.strptime( params[:filter][:date_to], '%m/%d/%Y')
      companies =  params[:filter][:business_entities].compact
      lead_sources =  params[:filter][:leads_sources].compact
      @report = case params[:filter][:lead_status]
                  when 'not_spam'
                    Lead.not_spam
                  when 'closed'
                    Lead.closed
                  when 'not_closed'
                    Lead.opened
                  else
                    Lead
                end
      @report = @report.where("contract_id IS NOT NULL") if params[:filter][:converted_to_contract].present? &&
          params[:filter][:converted_to_contract].to_i != 0
      @report = @report.select(%{ DATE("leads"."created_at") as date, COUNT("leads"."id") as cnt })
                    .joins(:lead_source)
                    .where(created_at: date_from.beginning_of_day..date_to.end_of_day,
                           interested_company_id: companies,
                           lead_source_id: lead_sources)
                    .group(%{ date })
      respond_to do |format|
        format.js { @chart = build_chart @report }
        format.csv { send_data build_csv(@report), type: 'text/csv; charset=iso-8859-1; header=present', disposition: "attachment; filename=leads_daily.csv"}
      end
    else
      respond_to do |format|
        flash.now[:error] = 'Bab filter params!'
        format.js
        format.csv
      end

    end
  end

  private
  def build_chart report
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Date')
    data_table.new_column('number', 'Leads count')
    report.each do |item|
      data_table.add_row([item.date, item.cnt])
    end
    opts = { width: 900, height: 700, title: 'Daily report', legend: 'bottom' }
    GoogleVisualr::Interactive::LineChart.new(data_table, opts)
  end

  def build_csv report
    CSV.generate do |csv|
      csv << ['Date', 'Leads count']
      report.each do |item|
        csv << [item.date, item.cnt]
      end
    end
  end

  def filter_valid?
    if !params[:filter].present? ||
        params[:filter][:date_from].blank? ||
        params[:filter][:date_to].blank? ||
        !params[:filter][:business_entities].present? ||
            params[:filter][:business_entities] == [""] ||
            !params[:filter][:leads_sources].present? ||
                params[:filter][:leads_sources] == [""]
      return false
    else
      return true
    end

  end
end