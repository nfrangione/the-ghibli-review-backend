require 'open-uri'
require 'net/http'
require 'json'

Review.destroy_all
User.destroy_all
Movie.destroy_all

ghibili_api = "https://ghibliapi.herokuapp.com/films"

class GetRequester 
    def initialize(url)
        @url = url
    end
    def get_response_body
        url = URI.parse(@url)
        resp = Net::HTTP.get_response(url)
        JSON.parse(resp.body)
    end
end

movies_response = GetRequester.new(ghibili_api)
movies = movies_response.get_response_body

movies.each do |movie|
    Movie.create(
        title: movie["title"],
        original_title: movie["original_title"],
        original_title_romanized: movie["original_title_romanized"],
        description: movie["description"],
        director: movie["director"],
        producer: movie["producer"],
        release_date: movie["realease_date"],
        run_time: movie["run_time"],
        rt_score: movie["rt_score"]
    )
end

User.create(username: "evanahouse", password: 123456)
User.create(username: "nfrangione", password: 123456)

Review.create(
    title: "New Review 1",
    content: "This is a fire review of an amazing film",
    score: 5,
    user_id: User.all.sample.id,
    movie_id: Movie.all.sample.id
)
Review.create(
    title: "New Review 2",
    content: "This is a fire review of another amazing film",
    score: 4,
    user_id: User.all.sample.id,
    movie_id: Movie.all.sample.id
)

