# Mindful Life Therapy

This is the code for the new Mindful Life Therapy website which is still in development.
The site currently lives at https://mlt-staging.herokuapp.com

## Setup

__Clone the repo__

`git clone git@github.com:murdoch/mindful-life-therapy.git`


__Create your own `config/master.key` file__

It's probably easiest to just create another throwaway rails app (by running something along the lines of `rails new throwaway`) and copying the file found at `config/master.key` from there into this repo


__Setup your own encrypted credentials file__ 

Again it's probably easiest to just copy the encrypted credentials file from the throwaway rails app you created in the previous step above this one, and pasting it into the config folder of this repo 

__Setup your encrypted credentials file__ 

You can edit your `config/credentials.yml.enc` by running `EDITOR='nano' bin/rails credentials:edit`
You need to make it look like the example credentials file found at `config/credentials.yml.example`

__Migrate and seed the database__

`bin/rails db:create db:migrate db:seed`

__Run the tests__

`bin/rails test`

__Personalise your application__ 

You probably want to use your own copy in your application, as the copy used in this repo only really applies to Mindful Life Therapy. So go ahead and change your copy to suit your project.

Also change the logo and all that stuff too as you probably want to use your own identity for your site, and the logo included in this repo is trademarked copyrighted and owned by Zoe Zalavary, so please don't use it.

## Questions? Bugs?

If you have any questions or find any bugs then please just create an issue here on github and I'll be happy to help.

## License

The license grant included with the Software is not for Mindful Life Threapy's trademarks, which include the logo designs. Mindful Life Thrapy reserves all trademark and copyright rights in and to all Mindful Life Therapy trademarks. Mindful Life Therapy's logos include, for instance, the stylized designs that include "logo" in the file title in the "logos" folder.

The names Mindful Life Therapy, and related logos and/or stylized names are trademarks of Mindful Life Therapy. You agree not to display or use these trademarks in any manner without Mindful Life Therapy's prior, written permission.

Furthermore, please do not use the same copy in your sites as the copy used in this repo is specific for Mindful Life Therapy, and you would be better off using your own.
