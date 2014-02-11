## Swoonatra - Sinatra Template for Web Apps

#### A Sinatra template for spinning up Heroku-ready Sinatra web applications.
 
New to the **Sinatra DSL // Ruby Web Framework**?  
Check out the website **[HERE](http://www.sinatrarb.com/)** and **[GitHub Repo](https://github.com/sinatra/sinatra)**.

At a high level, this template comes with the following features:  

- A **modular** Sinatra app using **Ruby 2.1.0** built in to get you started fast. 
- Local development using **SQLite3** and production using **PostgreSQL** on Heroku.
- Support for **ActiveRecord** model inheritance and database migrations.
- **Authentication Support** for **API**, **OAuth Keys**, or any sensitive information.
- Debugging tools like **Better Errors**, **Pry Debugger**, and **Sinatra Reloader**.
- **RSpec Integration** for testing your application, models, and concerns.

I've written in *comments* to explain all parts of the code base for you.  
This template *does not* come with any UI in place. That's for you to decide!

---

This project is made with <3 and uses a collection of tips and tricks.  
Let me know if you have any suggestions via comments / pull request!

### Information and Resources

Here are a few sections on how you can get started with this template.

#### > Up and Running

In order to use this template:

1.  Clone the repository via: `git clone git@github.com:CarlosPlusPlus/swoonatra.git`.
2.  `cd` into the repository and remove the .git folder: `rm -rf .git` folder.
3.  Perform a `git init` folder, or set as a remote to a respository already on GitHub.
4.  Ensure you have **PostgreSQL** installed on your machine.
	- If not installed and on a MAC, use Homebrew via Terminal: `brew install postgresql`
5. Run a `bundle install` to install all gem dependencies.
6. Run `rackup` to start your local server.
7. Visit `localhost:9292` in your favorite browswer.

All set and good to go!

#### > Security and Authentication

In order to use **API Keys**, **OAuth Keys**, or **sensitive information**:

- Rename `config/authentication.example.rb` to `config/authentication.rb`
- Add your API and authentication tokens etc. to `config/authentication.rb`

This will allow you to access them everywhere via the **ENV** hash.

#### > Gemfile

Here are the gems included with this template:

**Framework**  

- [sinatra](http://www.sinatrarb.com/)
- [sinatra-contrib](https://github.com/sinatra/sinatra-contrib)
- [activerecord](http://guides.rubyonrails.org/active_record_querying.html)
- [sinatra-activerecord](https://github.com/bmizerany/sinatra-activerecord)
- [sinatra-flash](https://github.com/SFEley/sinatra-flash)
- [sinatra-redirect-with-flash](https://github.com/vast/sinatra-redirect-with-flash)
- [sqlite3](https://github.com/luislavena/sqlite3-ruby)
- [rake](http://rake.rubyforge.org/)

---

**Debug**  

- [better_errors](https://github.com/charliesome/better_errors)
- [binding_of_caller](https://github.com/banister/binding_of_caller)
- [pry-debugger](https://github.com/nixme/pry-debugger)

---

**Test**

- [capybara](www.test.com)
- [factory_girl](www.test.com)
- [rspec](www.test.com)

---

**Development**  

- [tux](https://github.com/cldwalker/tux)

---

**Production**  

- [pg](https://github.com/ged/ruby-pg)

### Code Status

[![Build Status](https://travis-ci.org/CarlosPlusPlus/swoonatra.png?branch=master)](https://travis-ci.org/CarlosPlusPlus/swoonatra)    
[![Code Climate](https://codeclimate.com/github/CarlosPlusPlus/swoonatra.png)](https://codeclimate.com/github/CarlosPlusPlus/swoonatra)  
[![Dependency Status](https://gemnasium.com/CarlosPlusPlus/swoonatra.png)](https://gemnasium.com/CarlosPlusPlus/swoonatra)
