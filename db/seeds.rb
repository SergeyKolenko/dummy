include LeadsHelper

# # Fill lead source groups                id
# LeadSourceGroup.create(name: 'leaderssl') #1
# LeadSourceGroup.create(name: 'getucc')    #2
#
# Fill lead sources
lead_sources = [                                                #id
    { name: 'www.leaderssl.com',     lead_source_group_id: 1}, #1
    { name: 'newsite.instantssl.su', lead_source_group_id: 1}, #2
    { name: ' www.leaderssl.nl',     lead_source_group_id: 1}, #3
    { name: 'www.leaderssl.com.ua',  lead_source_group_id: 1}, #4
    { name: 'www.leaderssl.sg',      lead_source_group_id: 1}, #5
    { name: 'www.leaderssl.de',      lead_source_group_id: 1}, #6
    { name: 'www.leaderssl.be',      lead_source_group_id: 1}, #7
    { name: 'www.leaderssl.fr',      lead_source_group_id: 1}, #8
    { name: 'www.leaderssl.co.uk',   lead_source_group_id: 1}, #9
    { name: 'ca.leaderssl.com',      lead_source_group_id: 1}, #10
    { name: 'www.leaderssl.us',      lead_source_group_id: 1}, #11
    { name: 'www.leaderssl.cz',      lead_source_group_id: 1}, #12
    { name: 'www.leaderssl.gr',      lead_source_group_id: 1}, #13
    { name: 'www.leaderssl.ie',      lead_source_group_id: 1}, #14
    { name: 'www.leaderssl.ch',      lead_source_group_id: 1}, #15
    { name: 'www.leaderssl.si',      lead_source_group_id: 1}, #16
    { name: 'www.leaderssl.es',      lead_source_group_id: 1}, #17
    { name: 'www.getucc.com',        lead_source_group_id: 2}, #18
    { name: 'www.getwildcard.com',   lead_source_group_id: 2}  #19
]
LeadSource.create lead_sources
#
#
# # Fill Buisness Enteties
# busines_enteties = [                                          #id
#     { name: 'Microsoft', name_short: 'MS' },                  #1
#     { name: 'Apple Inc', name_short: 'Apple' },               #2
#     { name: 'JetBrains Company', name_short: 'JetBrains' },   #3
#     { name_short: 'GTR' },                                    #4
#     { name: 'Google' },                                       #5
#     { name: 'Some Company'},                                  #6
#     { name: nil, name_short: nil },                           #7
#     { name: nil, name_short: nil },                           #8
#     { name: 'Avangard and Co', name_short: 'Avan' },          #9
#     { name: 'Club younger peeoniers', name_short: 'CYP' }     #10
# ]
# BusinessEntity.create(busines_enteties)


# Fill Leads
leads = [
    { interested_company_id: 1,  lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 1,  lead_source_id: rand(1..19), status: 'open',     contract_id: 2 },
    { interested_company_id: 1,  lead_source_id: rand(1..19), status: 'job_done', contract_id: 12 },
    { interested_company_id: 2,  lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 2,  lead_source_id: rand(1..19), status: 'closed',   contract_id: 3 },
    { interested_company_id: 3,  lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 4,  lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 4,  lead_source_id: rand(1..19), status: 'closed',   contract_id: 425 },
    { interested_company_id: 4,  lead_source_id: rand(1..19), status: 'job_done', contract_id: 555 },
    { interested_company_id: 5,  lead_source_id: rand(1..19), status: 'open',     contract_id: 1111 },
    { interested_company_id: 5,  lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 6,  lead_source_id: rand(1..19), status: 'open',     contract_id: 123 },
    { interested_company_id: 7,  lead_source_id: rand(1..19), status: 'closed',   contract_id: 101 },
    { interested_company_id: 7,  lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 8,  lead_source_id: rand(1..19), status: 'job_done', contract_id: 112 },
    { interested_company_id: 8,  lead_source_id: rand(1..19), status: nil,        contract_id: nil },
    { interested_company_id: 9,  lead_source_id: rand(1..19), status: 'spam',     contract_id: 22 },
    { interested_company_id: 9,  lead_source_id: rand(1..19), status: 'job_done', contract_id: 44 },
    { interested_company_id: 9,  lead_source_id: rand(1..19), status: 'open',     contract_id: 202 },
    { interested_company_id: 7,  lead_source_id: rand(1..19), status: 'spam',     contract_id: nil },
    { interested_company_id: 10, lead_source_id: rand(1..19), status: 'open',     contract_id: nil },
    { interested_company_id: 10, lead_source_id: rand(1..19), status: 'closed',   contract_id: 999 },
    { interested_company_id: 10, lead_source_id: rand(1..19), status: 'spam',     contract_id: nil }
]
Lead.create leads

#random created_at
Lead.all.each do |lead|
    lead.created_at = time_rand
    lead.save
end