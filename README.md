# Food For Fido

## Description

Food For Fido is a web application that allows users to find dog friendly, healthy recipes for their pup. This web application has admin functionality in order to prevent users from creating "bad recipes" that do not fit the appropriate guidelines. The admin has the ability to create and delete recipes but cannot comment on recipes. The comment space is meant to be utilized by the users where they can create, rate, comment, edit, and delete comments on recipes.

Food For Fido was created using the web application framework Ruby, implemented using Ruby, HTML, and SASS/SCSS.

## Visuals

The [icon](https://www.istockphoto.com/vector/cute-jack-russell-terrier-paws-up-over-wall-dog-face-cartoon-vector-illustration-gm1158317995-316369293) for the web application. The web application was styled using [SASS/SCSS](https://sass-lang.com/documentation).

## Installation

To install this web application go to your terminal:

- clone `git@github.com:lisellelogan/food-for-fido.git`
- Then, `cd food-for-fido and code .`
- Once inside the directory, run `bundle install` in terminal to utilize the gems necessary for this web application.

## Usage 

To use the web application run `rails s` to start your local server.

You should see something like this if it was successful:
```bash
=> Booting Puma
=> Rails 6.1.3 application starting in development 
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 5.2.1 (ruby 2.6.1-p33) ("Fettisdagsbulle")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 39457
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```
You will be able to access your web application through the link provided by rails s `http://127.0.0.1:3000` or you can go to your web browser and use http://localhost:3000/.

For more information on using the web application see this short [video](https://www.youtube.com/watch?v=xLypFHFCnTQ&feature=youtu.be) demo.

## Contributor's Guide

Pull requests are welcome. For any major changes, please open an issue first to discuss changes you would like to make.

Please make sure to update tests appropriately.

## License

[MIT](https://opensource.org/licenses/MIT)