Infofund.controllers  do
  get "/" do
    @location = "home"
    @funds = Fund.all
    @user = User.first
    render 'index'
  end

  get '/daily' do
    @location = "daily"
    @funds = Fund.all
    render 'daily'
  end

  get '/contact' do
    @location = "contact"
  end

  get '/about' do
    @location = "about"
  end

  get :fund, :with => :id, :provides => :json do
    @fund = Fund.find(params[:id])

    {
      :name => @fund.name,
      :values => @fund.daily_value_variation
    }.to_json
  end
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  
end
