Pagy::DEFAULT[:page] = 1 # default page to start with
Pagy::DEFAULT[:items] = 10 # items per page
Pagy::DEFAULT[:cycle] = false # when on last page, click "Next" to go to first page

require 'pagy/extras/items'
Pagy::DEFAULT[:max_items] = 10 # max items possible per page

require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page 
  
# load the "en" and "de" locale defined in the custom files at :filepath:
Pagy::I18n.load({ locale: 'en', filepath: 'config/locales/en.yml' })
