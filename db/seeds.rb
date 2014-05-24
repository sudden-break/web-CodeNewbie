# Create Initial Seed Data for Resources

resources = Resources.create([
  {
    name:          'App Academy',
    link:          'http://www.appacademy.io/',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'Codecademy',
    link:          'http://www.codecademy.com/',
    format_list:   'online,self-directed',
    proglang_list: 'php,python,ruby'
  },
  {
    name:          'Code School',
    link:          'http://www.codeschool.com/',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ruby,ios'
  },
  {
    name:          'Dev Bootcamp',
    link:          'http://devbootcamp.com/',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'Flatiron School',
    link:          'http://www.flatironschool.com/',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails,ios'
  },
  {
    name:          'Fullstack Academy',
    link:          'http://www.fullstackacademy.com/',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails' 
  },
  {
    name:          'gSchool',
    link:          'http://www.galvanize.it/school#our-school',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails' 
  },
  {
    name:          'Hackbright Academy',
    link:          'http://hackbrightacademy.com/',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,python' 
  },
  {
    name:          'Hacker School',
    link:          'https://www.hackerschool.com/',
    format_list:   'in-person,self-directed',
    proglang_list: 'c++,java,ruby,python' 
  },
  {
    name:          'How To Learn Javascript Properly',
    link:          'http://javascriptissexy.com/how-to-learn-javascript-properly/',
    format_list:   'online,self-directed',
    proglang_list: 'javascript'
  },
  {
    name:          'Learn to Program',
    link:          'https://pine.fm/LearnToProgram/',
    format_list:   'book,ebook,self-directed',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Maker Square',
    link:          'http://www.makersquare.com/',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'RailsBridge',
    link:          'http://railsbridge.org/',
    format_list:   'workshop,in-person,community',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Rails Girls',
    link:          'http://railsgirls.com/',
    format_list:   'workshop,in-person,community',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Ruby on Rails Tutorial',
    link:          'http://www.railstutorial.org/book',
    format_list:   'online,self-directed',
    proglang_list: 'javascript'
  },
  {
    name:          'Skillcrush',
    link:          'http://skillcrush.com/',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'Skillshare',
    link:          'http://www.skillshare.com/classes/technology?levels=2',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ios'
  },
  {
    name:          'Thinkful',
    link:          'https://www.thinkful.com/',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,python,ruby,rails'
  },
  {
    name:          'Treehouse',
    link:          'http://teamtreehouse.com/',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ruby,rails,php,python'
  },
  {
    name:          'Try Git',
    link:          'https://try.github.io/levels/1/challenges/1',
    format_list:   'online,self-directed',
    proglang_list: 'git'
  },
  {
    name:          'Try JQuery',
    link:          'https://www.codeschool.com/courses/try-jquery',
    format_list:   'online,self-directed',
    proglang_list: 'javascript,jquery'
  }
])

jobs = Job.create([
  {
    name:           "Constant Contact Apprenticeship",
    company:        "Constant Contact",
    link:           "http://constantcontact.com",
    location_list:  "NYC",
    proglang_list:  "rails, ruby, javascript",
    position_list:  "apprentice"
  },
  {
    name:           "Apprentice.io",
    company:        "ThoughtBot",
    link:           "http://apprentice.io",
    proglang_list:  "ruby, rails",
    location_list:  "Chicago, NYC",
    position_list:  "apprentice"
  },
  {
    name:           "Hungry Academy",
    company:        "Living Social and JumpstartLab",
    link:           "http://hungryacademy.com/",
    proglang_list:  "ruby, rails",
    location_list:  "DC",
    position_list:  "apprentice",
    description:    "A unique and game changing five-month learning experience."
  },
  {
    name:           "Craftsmanship Academy",
    company:        "RoleModel Software",
    link:           "http://craftsmanshipacademy.com/",
    proglang_list:  "ruby, rails, html, css, javascript, sql, objective-c, android",
    location_list:  "NC",
    position_list:  "apprentice",
    description:    "Training the next generation of top software developers."
  },
  {
    name:           "Apprenticeship",
    company:        "8thlight",
    link:           "http://www.8thlight.com/apprenticeship",
    proglang_list:  "ruby, rails",
    location_list:  "Chicago, IL, London",
    position_list:  "apprentice",
    description:    "8th Light offers a step on the pathway to mastery through apprenticeship."
  }
])