include LeadsHelper
# Fill Buisness Enteties
busines_enteties = [
    { name: 'Microsoft', name_short: 'MS' },                  #1
    { name: 'Apple Inc', name_short: 'Apple' },               #2
    { name: 'JetBrains Company', name_short: 'JetBrains' },   #3
    { name_short: 'GTR' },                                    #4
    { name: 'Google' },                                       #5
    { name: 'Some Company'},                                  #6
    { name: nil, name_short: nil },                           #7
    { name: nil, name_short: nil },                           #8
    { name: 'Avangard and Co', name_short: 'Avan' },          #9
    { name: 'Club younger peeoniers', name_short: 'CYP' }     #10
]
BusinessEntity.create(busines_enteties)


# Fill Leads
leads = [
    { interested_company_id: 1,  lead_source: 'newsite.instantssl.su', status: 'open',     contract_id: nil },
    { interested_company_id: 1,  lead_source: 'www.leaderssl.be',      status: 'open',     contract_id: 2 },
    { interested_company_id: 1,  lead_source: 'www.leaderssl.co.uk',   status: 'job_done', contract_id: 12 },
    { interested_company_id: 2,  lead_source: 'newsite.instantssl.su', status: 'open',     contract_id: nil },
    { interested_company_id: 2,  lead_source: 'www.leaderssl.cz',      status: 'closed',   contract_id: 3 },
    { interested_company_id: 3,  lead_source: 'www.leaderssl.cz',      status: 'open',     contract_id: nil },
    { interested_company_id: 4,  lead_source: 'newsite.instantssl.su', status: 'open',     contract_id: nil },
    { interested_company_id: 4,  lead_source: 'www.leaderssl.es',      status: 'closed',   contract_id: 425 },
    { interested_company_id: 4,  lead_source: 'www.getucc.com',        status: 'job_done', contract_id: 555 },
    { interested_company_id: 5,  lead_source: 'www.getucc.com.uk',     status: 'open',     contract_id: 1111 },
    { interested_company_id: 5,  lead_source: 'newsite.instantssl.su', status: 'open',     contract_id: nil },
    { interested_company_id: 6,  lead_source: 'newsite.instantssl.su', status: 'open',     contract_id: 123 },
    { interested_company_id: 7,  lead_source: 'www.getucc.com',        status: 'closed',   contract_id: 101 },
    { interested_company_id: 7,  lead_source: 'www.leaderssl.com',     status: 'open',     contract_id: nil },
    { interested_company_id: 8,  lead_source: 'www.leaderssl.com',     status: 'job_done', contract_id: 112 },
    { interested_company_id: 8,  lead_source: 'newsite.instantssl.su', status: nil,        contract_id: nil },
    { interested_company_id: 9,  lead_source: 'www.getucc.com.uk',     status: 'spam',     contract_id: 22 },
    { interested_company_id: 9,  lead_source: 'newsite.instantssl.su', status: 'job_done', contract_id: 44 },
    { interested_company_id: 9,  lead_source: 'www.getucc.com',        status: 'open',     contract_id: 202 },
    { interested_company_id: 7,  lead_source: 'newsite.instantssl.su', status: 'spam',     contract_id: nil },
    { interested_company_id: 10, lead_source: 'newsite.instantssl.su', status: 'open',     contract_id: nil },
    { interested_company_id: 10, lead_source: 'newsite.instantssl.su', status: 'closed',   contract_id: 999 },
    { interested_company_id: 10, lead_source: 'newsite.instantssl.su', status: 'spam',     contract_id: nil }
]
Lead.create leads

#random created_at
Lead.all.each do |lead|
    lead.created_at = time_rand
    lead.save
end