require 'csv'

athletes = [
  {
    id: 1,
    first_name: "Mannix",
    last_name: "Kennedy",
    dob: "1990-02-03",
    email: "mannix@chasers.com",
    weight: 84,
    third_party_consent: true
  },
  {
    id: 2,
    first_name: "Kirk",
    last_name: "Orr",
    dob: "1996-07-27",
    email: "kirk4684@chasers.com",
    weight: 182,
    third_party_consent: true
  },
  {
    id: 3,
    first_name: "Abel",
    last_name: "Jimenez",
    dob: "1998-09-17",
    email: "abel@chasers.com",
    weight: 83,
    third_party_consent: true
  },
  {
    id: 4,
    first_name: "Damian",
    last_name: "Carver",
    dob: "1991-06-05",
    email: "damian9205@chasers.com",
    weight: 86,
    third_party_consent: true
  },
  {
    id: 5,
    first_name: "Graham",
    last_name: "Ross",
    dob: "1997-03-05",
    email: "graham@chasers.com",
    weight: 90,
    third_party_consent: true
  },
  {
    id: 6,
    first_name: "Seth",
    last_name: "Roy",
    dob: nil,
    email: nil,
    weight: 83,
    third_party_consent: true
  },
  {
    id: 7,
    first_name: "Christopher",
    last_name: "Castaneda",
    dob: "1998-03-11",
    email: nil,
    weight: 176,
    third_party_consent: true
  },
  {
    id: 8,
    first_name: "Brendan",
    last_name: "Martin",
    dob: "1994-10-20",
    email: "brendan@chasers.com",
    weight: 89,
    third_party_consent: false
  },
  {
    id: 9,
    first_name: "Oscar",
    last_name: "Carey",
    dob: "1988-06-14",
    email: "oscar@chasers.com",
    weight: 0,
    third_party_consent: true
  },
  {
    id: 10,
    first_name: "Gary",
    last_name: "Hunt",
    dob: "1995-08-14",
    email: "gary1765@chasers.com",
    weight: 200,
    third_party_consent: true
  },
  {
    id: 11,
    first_name: "Ross Whitehead",
    last_name: "",
    dob: "1989-10-18",
    email: "ross@chasers.com",
    weight: nil,
    third_party_consent: true
  },
  {
    id: 12,
    first_name: "Ronan",
    last_name: "Duran",
    dob: "1994-04-04",
    email: "ronan3466@chasers.com",
    weight: 85,
    third_party_consent: true
  },
  {
    id: 13,
    first_name: "Julian",
    last_name: "Bean",
    dob: "1991-07-17",
    email: nil,
    weight: 94,
    third_party_consent: true
  },
  {
    id: 14,
    first_name: "Connor",
    last_name: "McCarty",
    dob: "1995-07-27",
    email: "connor@chasers.com",
    weight: 85,
    third_party_consent: true
  },
  {
    id: 15,
    first_name: "Ryan",
    last_name: "Hardy",
    dob: "1988-05-21",
    email: "ryan6102@chasers.com",
    weight: 88,
    third_party_consent: true
  }
]

CSV.open("../athletes.csv", "w") do |csv|
  csv << ["id", "first_name", "last_name", "dob", 'email', 'weight', 'third_party_consent']
  athletes.each do |athlete|
    csv << athlete.values
  end
end
