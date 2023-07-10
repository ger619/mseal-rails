
![](https://img.shields.io/badge/Microverse-blueviolet)
# The official Murang'a Seals Football Club Website

>This is the official Murang'a Seals Website built with Ruby on Rails. It is a website that allows users to view the club's information, players, fixtures, and results. It also allows the club's admin to manage the club's information, players, fixtures, and results.

## Link
``

``
## Video link



## ERD


### Cloning the project

git clone https://github.com/Lifeline-Solutions/mseal-rails.git <Your-Build-Directory>
``` 
- cd mseal-rails

- ./bin/dev
```


## Built with
- Ruby 3.1.2 on Rails 7.0.3.1
- PostgreSQL

## Prerequisites

Vscode or RubyMine
Setup

## Install
    Ruby
    Rails
    PostgreSql
    Tailwindcss

### Development Database

```
# Sign into posgresql
su - postgres

# Create user
create user 'user_name' with encrypted password 'mypassword'

# Load the schema
rails db:schema:load

#----- If you want prefer this approach
# Create the database
rake db:create

# Create database Migration
rails db:migrate
```

### Run

```
bundle install

./bin/dev
```

## Run tests
```
bundle install
rspec
```

## Authors

👤 **AbolGer**

- GitHub: [@ger619](https://github.com/ger619)
- Twitter: [@ger_abol](https://twitter.com/ger_abol)
- LinkedIn: [David Ger](https://linkedin.com/in/david-ger-426b4576)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Lifeline-Solutions/mseal-rails/issues).

## Design

Original design idea by [Annah Waweru](https://www.figma.com/file/6zsi1cWfC3PzQNzxXXuSxI/Website-version-2.0?type=design&node-id=1-2&mode=design) on Behance.
The Creative Commons license of the design requires that you give appropriate credit to the author.
## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
