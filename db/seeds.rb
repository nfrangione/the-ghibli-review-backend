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
        original_title_romanized: movie["original_title_romanised"],
        description: movie["description"],
        director: movie["director"],
        producer: movie["producer"],
        release_date: movie["release_date"],
        run_time: movie["running_time"],
        rt_score: movie["rt_score"]
    )
end
img_array = [
        
        {title: "Castle in the Sky", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/1476-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Grave of the Fireflies", img_url: "https://www.reelviews.net/resources/img/posters/thumbs/grave_poster.jpg"},
        {title: "My Neighbor Totoro", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/poster_my_neighbor_totoro-683x1024.jpg"},
        {title: "Kiki's Delivery Service", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/poster_kiki-683x1024.jpg')"},
        {title: "Only Yesterday", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/16933-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Porco Rosso", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/poster_porco_rosso-683x1024.jpg')"},
        {title: "Pom Poko", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/1482-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Whisper of the Heart", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/mma3207pf_lo.jpg"},
        {title: "Princess Mononoke", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/06/poster_mononoke-683x1024.jpg"},
        {title: "My Neighbors the Yamadas", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/1484-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Spirited Away", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/1055-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "The Cat Returns", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/poster_cat_returns-683x1024.jpg"},
        {title: "Howl's Moving Castle", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/2783-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Tales from Earthsea", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/5845-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Ponyo", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/14815-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "Arrietty", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/arrietty_poster-683x1024.jpg"},
        {title: "From Up on Poppy Hill", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/arrietty_poster-683x1024.jpg"},
        {title: "The Wind Rises", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/poster_wind_rises-683x1024.jpg"},
        {title: "The Tale of the Princess Kaguya", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/18651-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "When Marnie Was There", img_url: "https://www.studioghibli.com.au/wp-content/uploads/2017/07/22719-title-treatment-portrait-key-art-normal-medium-683x1024.jpg"},
        {title: "The Red Turtle", img_url: "https://i.ebayimg.com/images/g/rRAAAOSw2gxYrWd4/s-l300.jpg"}
    ]

img_array.each do |image|
    movie = Movie.find_by(title: image[:title])
    movie.image_url = image[:img_url]
    movie.save
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

