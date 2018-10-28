# Mindful Life Therapy

This is the code for the new Mindful Life Therapy website which is still in development.
The site currently lives at https://mlt-staging.herokuapp.com

## Setup

- Clone the repo
- Create your own `config/master.key` file - it's probably easiest to just create another throwaway rails app (by running `rails new xyz`) and copying the file found at `config/master.key` from there into this repo
- Setup your own encrypted credentials file - again it's probably easiest to just copy the encrypted credentials file from the the throwaway rails app you created in the step above this one 
- Setup your encrypted credentials file to look like the credentials.yml.example file found in the config directory of this repo
- Migrate and seed the database - `bin/rails db:create db:migrate db:seed`
- Change the copy for the individual pages (about page, counselling page, mindfulness page), etc as it only really applies to Mindful Life Therapy.
- Change the logo and all that stuff too as you probably want to use your own identity for your site.

## Questions? Bugs?

If you have any questions or find any bugs then please just create an issue here on github and I'll be happy to help.

## License

The license grant included with the Software is not for Mindful Life Threapy's trademarks, which include the logo designs. Mindful Life Thrapy reserves all trademark and copyright rights in and to all Mindful Life Therapy trademarks. Mindful Life Therapy's logos include, for instance, the stylized designs that include "logo" in the file title in the "logos" folder.

The names Mindful Life Therapy, and related logos and/or stylized names are trademarks of Mindful Life Therapy. You agree not to display or use these trademarks in any manner without Mindful Life Therapy's prior, written permission.

Furthermore, please do not use the same copy in your sites as the copy used in this repo is specific for Mindful Life Therapy, and you would be better off using your own.
