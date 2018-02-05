# README

1. routes.rb
resources :tests, only: [:index, :new, :create]
```
Rails.application.routes.draw do
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```

2. rails g migration CreateClassesTable

```
class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
```
3. bundle exec rake db:migrate

4. app/controllers/tests_controller.rb
```
class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      # render :index, cannot do this because it does not refresh the page
      redirect_to tests_path
    else
      # render error message
    end
  end

  private

  def test_params
    params.require(:test).permit(:name)
  end
end
```

5. app/models/class.rb
```
class Test < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
```

6. app/views/tests/index.html.erb
```
<% if !@tests.blank? %>
  <% @tests.each do |test| %>
    <%= test.name %>
  <% end  %>
<% end %>

<%= link_to "new", new_test_path %>
```
7. app/views/tests/new.html.erb
```
<%= form_for @test, action: "create" do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %>
  <%= submit_tag("submit") %>
<% end %>

<form accept-charset="UTF-8" action="/tests" method="post">
  <label for="test_name">Name</label>
  <!--  need auth token-->
  <input id="test_name" name="test[name]" type="text"/>
  <input type="submit" name="comit" value="submit" />
</form>
```
