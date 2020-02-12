# Rails-Facebook

This repository is meant to be a Facebook-inspired site, in which members can have basic facebook functionality.

Rails-facebook provides a basic functionality based on the social network -and data miner- Facebook. Creating an account, befriending other users, create posts and see other users', and even sign in with your actual facebook account.

## Built With

- Ruby v2.6.3
- Rails v6.0.1
- Bootstrap v4.4.0

## Live Demo

### [Live version on Heroku](https://immense-shelf-90273.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
- Ruby v2.6.3
- Rails v6.0.1
- Yarn v1.21.1
- A Heroku account setup(only for deployment)

### Setup

Clone the repository with:

```bash
git clone https://github.com/chincoya/rails-facebook
```

Then change to the repository directory, with

```bash
 cd rails-facebook/
```

### Install

Use the Rails specific Bash command
```bash
bundle install
```
to install missing gems and packages needed -as specified inside the gemfile and yarn.lock. Afterwards, run the database migration with:

```bash
rails db:migrate
```

### Usage

If you followed the steps correctly, you should be able to run the Rails server with the command:
```bash
rails server
```

### Run tests

To run unit and integration tests, run the command:

```bash
bundle exec rspec
```

### Deployment

Deployment instructions are summarized on [Heroku's site](https://devcenter.heroku.com/articles/getting-started-with-rails6)

## Authors

  **Roberto Erick Nava**

- Github: [@Oitur](https://github.com/Oitur)

**Daniel Chincoya Rodríguez**

- Github: [@chincoya](https://github.com/chincoya)
- Twitter: [@chincoya7](https://twitter.com/chincoya7)

## Contributing

For contributions, fork the repository and issue a pull request if you feel the need. 

Feel free to check the [issues page](issues/).

## Acknowledgments

- Rails camp, for the tutorial on integrating Omniauth with Devise on Rails 6.

## License

This project is [MIT](lic.url) licensed.
