# Create Initial Seed Data for Resources

podcast = Podcast.create({
    id:            1,
    name:          'Ep. 1 - Bootcamps, Water Coolers, and Hiring Devs',
    description:   "Carlos Lazo, software developer at Time Inc. and graduate of the programming bootcamp, the Flatiron School, shares his unique programming experiences in the first episode of the CodeNewbie podcast. We talk about working in hardware and software, the difference between studying computer science and actually being an engineer, what he's learned from leading recruitment and interviewing over 100 engineers, and why after all that, he decided to attend a three-month bootcamp to become a web developer. There's also some info on a particularly cool water cooler.",
    published_on:   Time.now,
    audio_link:     'http://static.squarespace.com/static/5161ac76e4b0d5cb924e7ed5/t/54173800e4b0aad39e696e53/1410807808151/Carlos-Audition_mixdown_cbr.mp3/original/Carlos-Audition_mixdown_cbr.mp3'
  })

guests = Guest.create([
  {
    id:              1,
    first_name:      'Carlos',
    full_name:       'Carlos Lazo',
    podcast_id:         1          
  },
  {
    id:              2,
    first_name:      'Saron',
    full_name:       'Saron Yitbarek',
    podcast_id:         1
  }
])

pick = Pick.create([
  {
    id:             1,
    name:           "Traffic Lights",
    link:           "http://trafficlights.com",
    author:         Guest.find(2),
    podcast_id:     1
  },
  {
    id:             1,
    name:           "Coolest Cooler",
    link:           "http://coolestcooler.com",
    author:         Guest.find(1),
    podcast_id:     1
  }
])

resources = Resource.create([
  {
    name:          'App Academy',    
    link:          'http://www.appacademy.io/',
    description:   'An immersive web development and job placement program in San Francisco and New York City.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'Codecademy',
    link:          'http://www.codecademy.com/',
    description:   'Teaching the world how to code by building interactive websites, fun games, and apps.',
    format_list:   'online,self-directed',
    proglang_list: 'php,python,ruby'
  },
  {
    name:          'Code School',
    link:          'http://www.codeschool.com/',
    description:   'Code School teaches web technologies in the comfort of your browser with video lessons, coding challenges, and screencasts.',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ruby,ios'
  },
  {
    name:          'Dev Bootcamp',
    link:          'http://devbootcamp.com/',
    description:   'In 9 intense weeks, you will become a web developer.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'Flatiron School',
    link:          'http://www.flatironschool.com/',
    description:   'Learn to build awesome things with code.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails,ios'
  },
  {
    name:          'Fullstack Academy',
    link:          'http://www.fullstackacademy.com/',
    description:   'Passionate Teachers + Cutting-edge Curriculum. This is Fullstack.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails' 
  },
  {
    name:          'G School',
    link:          'http://www.galvanize.it/school#our-school',
    description:   'Learn from the best and launch a new path through our rigorous developer training programs.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails' 
  },
  {
    name:          'Hackbright Academy',
    link:          'http://hackbrightacademy.com/',
    description:   'The Engineering Fellowship for Women.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,python' 
  },
  {
    name:          'Hacker School',
    link:          'http://www.hackerschool.com/',
    description:   'Hacker School is a retreat for programmers.',
    format_list:   'in-person,self-directed',
    proglang_list: 'c++,java,ruby,python' 
  },
  {
    name:          'How To Learn Javascript Properly',
    link:          'http://javascriptissexy.com/how-to-learn-javascript-properly/',
    description:   'Learn JavaScript Properly (For NON-JavaScript Programmers and First-time Programmers).',
    format_list:   'online,self-directed',
    proglang_list: 'javascript'
  },
  {
    name:          'Learn to Program',
    link:          'http://pine.fm/LearnToProgram/',
    description:   'A Place to Start for the Future Programmer.',
    format_list:   'book,ebook,self-directed',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Maker Square',
    link:          'http://www.makersquare.com/',
    description:   'We Create Developers by teaching software engineering fundamentals.',
    format_list:   'bootcamp,in-person',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'RailsBridge',
    link:          'http://railsbridge.org/',
    description:   'RailsBridge workshops are a free and fun way to get started or level up with Rails, Ruby, and other web technologies.',
    format_list:   'workshop,in-person,community',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Rails Girls',
    link:          'http://railsgirls.com/',
    description:   'Our aim is to give tools and a community for women to understand technology and to build their ideas.',
    format_list:   'workshop,in-person,community',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Ruby on Rails Tutorial',
    link:          'http://www.railstutorial.org/book',
    description:   '“If I want to learn web development with Ruby on Rails, where should I start? This book.',
    format_list:   'online,self-directed',
    proglang_list: 'ruby,rails'
  },
  {
    name:          'Skillcrush',
    link:          'http://skillcrush.com/',
    description:   "It doesn't matter where you live or what you do, DIGITAL SKILLS are JOB SKILLS.",
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ruby,rails'
  },
  {
    name:          'Skillshare',
    link:          'http://www.skillshare.com/classes/technology?levels=2',
    description:   'Master real-world skills taught by industry leaders.',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ios'
  },
  {
    name:          'Thinkful',
    link:          'http://www.thinkful.com/',
    description:   'Join us to learn faster with online one-on-one mentorship.',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,python,ruby,rails'
  },
  {
    name:          'Treehouse',
    link:          'http://teamtreehouse.com/',
    description:   'Learn how to build websites & apps, write code or start a business.',
    format_list:   'online,self-directed',
    proglang_list: 'html,css,javascript,ruby,rails,php,python'
  },
  {
    name:          'Try Git',
    link:          'http://try.github.io/levels/1/challenges/1',
    description:   'Learn the fundamentals of Git thanks to CodeSchool.',
    format_list:   'online,self-directed',
    proglang_list: 'git'
  },
  {
    name:          'Try JQuery',
    link:          'http://www.codeschool.com/courses/try-jquery',
    description:   'Learn the fundamentals of jQuery thanks to CodeSchool.',
    format_list:   'online,self-directed',
    proglang_list: 'javascript,jquery'
  }
])

jobs = Job.create([
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

challenges = Challenge.create([
  {
    name: "The Commit",
    source: "We got the hastag from the awesome <a href='https://twitter.com/danielchangNYC'>Dan Chang</a> and this idea from John Resig's awesome blog post 'Write Code Every Day'. Read it <a href='http://ejohn.org/blog/write-code-every-day/'>here</a>",
    description: "Make one commit every day. It can be small, big, and in any language you want. And when you do, tell us about it. Tweet us at <a href='https://twitter.com/codenewbies'>@CodeNewbies</a> with the hashtag <a href='http://https://twitter.com/search?f=realtime&q=%23thecommit&src=typd'>#theCommit</a>. Happy coding!",
    slug: "the-commit",
    current: true,
    hashtag: "#TheCommit"
  }
])
