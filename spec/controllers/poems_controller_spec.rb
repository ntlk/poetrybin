require 'spec_helper'

describe PoemsController do

  before do
    @poem = Poem.create(title: 'My poem', body: 'Violets are blue')
  end

  it 'does not hide a poem if person is not logged in' do
    put :hide, {id: @poem.id}
    @poem.reload

    expect(@poem).to_not be_hidden
  end

  it 'does hide a poem when person is an admin' do
    login_as_admin
    put :hide, {id: @poem.id}
    @poem.reload

    expect(@poem).to be_hidden
  end

  def login_as_admin
    session[:admin] = true
  end
end
