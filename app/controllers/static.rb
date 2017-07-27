get '/' do
  erb :"links/about_us"
end

get '/about_us' do
	erb :"links/about_us"
end

get "/links" do
	@link = Link.all
	erb :"links/new"
end

get '/links/new' do
	erb :"links/index"
end

get '/:short' do
	@short=params[:short]
	@link = Link.find_by(encrypt: @short)
	@link.click_count += 1
	@link.save
	erb :"links/redirect"
end

post "/links_create" do
	@link = Link.create(link: params[:long_url], encrypt: SecureRandom.hex(4))
	if @link.save
	else
		@errors = @link.errors.full_messages.join(",")
	end
	@link = Link.all
	erb :"links/new"
end

post "/:id/count" do
	@link = Link.find(params[:id])
	@link.click_count += 1
	@link.save
	redirect @link.link
end