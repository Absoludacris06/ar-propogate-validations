get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
	@event = Event.new
  erb :event_create
end

post '/events/create' do
  @event = Event.new(params[:event])
  p @event.date
  p @event.date.class
  if @event.save
  	redirect to('/')
  else
  	@errors = @event.errors.full_messages
  	erb :event_create
  end
end
