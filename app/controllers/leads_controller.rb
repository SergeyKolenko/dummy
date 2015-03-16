class LeadsController < ApplicationController

  before_filter :set_lead_sources, only: [:new, :edit, :daily_new]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leads }
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @lead = Lead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/new
  # GET /leads/new.json
  def new
    @lead = Lead.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.find(params[:id])
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(params[:lead])

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render json: @lead, status: :created, location: @lead }
      else
        format.html { render action: "new" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leads/1
  # PUT /leads/1.json
  def update
    @lead = Lead.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end


  def daily_new
    @business_entities = BusinessEntity.all
  end

  def daily_create
    date_from = params[:filter][:date_from].blank? ? DateTime.now : DateTime.strptime( params[:filter][:date_from], '%m/%d/%Y')
    date_to = params[:filter][:date_to].blank? ? DateTime.now : DateTime.strptime( params[:filter][:date_to], '%m/%d/%Y')
    # FIXME: after compact! [""]
    companies = params[:filter][:business_entities].present? ? params[:filter][:business_entities].compact : BusinessEntity.pluck(:id)
    lead_sources = params[:filter][:leads_sources].present? ? params[:filter][:leads_sources].compact : LeadSource.pluck(:id)
    puts lead_sources.inspect
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
    @report = @report.where("contract_id IS NOT NULL") if params[:filter][:converted_to_contract].present? && params[:filter][:converted_to_contract].to_i != 0
    @report = @report.select(%{ DATE("leads"."created_at") as date, COUNT("leads"."id") as cnt })
                  .joins(:lead_source)
                  .where(created_at: date_from.beginning_of_day..date_to.end_of_day,
                         interested_company_id: companies,
                          lead_source_id: lead_sources)
                  .group(%{ date })
    respond_to do |format|
      format.js do
          @chart = build_chart @report
      end
      format.csv { send_data build_csv(@report), :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=leads_daily.csv"}
    end
  end

  private
  def set_lead_sources
    @lead_sources = LeadSource.for_select
  end

  def build_chart report
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Date')
    data_table.new_column('number', 'Leads count')
    report.each do |item|
      data_table.add_row([item.date, item.cnt])
    end
    opts = { :width => 900, :height => 700, :title => 'Daily report', :legend => 'bottom' }
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

end