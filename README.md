# README

1. routes.rb
resources :classes, only: [:index]

2. rails g migration CreateClassesTable

```
class CreateClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :classes do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
```
3. bundle exec rake db:migrate

4. app/controllers/classes_controller.rb

5. app/models/class.rb

6. app/views/classes/index.html.erb
