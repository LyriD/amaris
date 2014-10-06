module Refinery
  module People
    module Admin
      class PeopleController < ::Refinery::AdminController

        crudify :'refinery/people/person',
                :title_attribute => 'first_name',
                :xhr_paging => true

      end
    end
  end
end
