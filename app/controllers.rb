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

  get '/login' do
    render 'login'
  end

  get :fund, :with => :id, :provides => :json do
    @fund = Fund.find(params[:id])

    {
      :name => @fund.name,
      :values => @fund.daily_value_variation
    }.to_json
  end
end
