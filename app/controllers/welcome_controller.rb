require 'net/http'

class WelcomeController < ApplicationController

  @@urlAPI = 'https://swapi-graphql-integracion-t3.herokuapp.com'

  def index

    body_index = {"query": "query{allFilms{edges{node{title,releaseDate,episodeID,director,producers,id}}}}"}

    url = HTTParty.post('https://swapi-graphql-integracion-t3.herokuapp.com',
      body: body_index)
    
    response = JSON.parse(url.to_json)
    @peliculas = response["data"]["allFilms"]["edges"]
    for pelicula in @peliculas do
      puts ("PELICULA")
      puts pelicula["node"]["title"]
    end
    
    #render json: response["data"]["allFilms"]["edges"]

  end

  def film

    filmID = '"' + params[:filmID] + '"'

    body_film = {"query": "query{
      film(id: #{filmID}) {
        title
        episodeID
        director
        producers
        id
        created
        edited
        releaseDate
        openingCrawl
        planetConnection {
          edges {
            node {
              id
              name
            }
          }
        }
        starshipConnection {
          edges {
            node {
              id
              name
            }
          }
        }
        characterConnection {
          edges {
            node {
              id
              name
            }
          }
        }
      }
    }"}

    url = HTTParty.post('https://swapi-graphql-integracion-t3.herokuapp.com',
      body: body_film)
    
    response = JSON.parse(url.to_json)
    @film = response["data"]["film"]

  end

  def planet

    planetID = '"' + params[:planetID] + '"'

    body_planet = {"query": "query{
      planet(id: #{planetID}) {
        id
        name
        gravity
        created
        diameter
        climates
        terrains
        population
        surfaceWater
        orbitalPeriod
        rotationPeriod
        filmConnection {
          edges {
            node {
              id
              title
            }
          }
        }
        residentConnection {
          edges {
            node {
              id
              name
            }
          }
        }
      } 
    }"}

    url = HTTParty.post('https://swapi-graphql-integracion-t3.herokuapp.com',
      body: body_planet)
    
    response = JSON.parse(url.to_json)
    @planet = response["data"]["planet"]

  end

  def character

    characterID = '"' + params[:characterID] + '"'

    body_character = {"query": "query{
      person(id: #{characterID}) {
        id
        name
        mass
        created
        birthYear
        hairColor
        starshipConnection {
          edges {
            node {
              id
              name
            }
          }
        }
        gender
        height
        edited
        species {
          id
          name
        }
        eyeColor
        skinColor
        homeworld {
          id
          name
        }
        filmConnection {
          edges {
            node {
              id
              title
            }
          }
        }
        vehicleConnection {
          edges {
            node {
              id
            }
          }
        }
      } 
    }"}

    url = HTTParty.post('https://swapi-graphql-integracion-t3.herokuapp.com',
      body: body_character)
    
    response = JSON.parse(url.to_json)
    @character = response["data"]["person"]

  end

  def ship

    shipID = '"' + params[:shipID] + '"'

    body_ship = {"query": "query{
      starship(id: #{shipID}) {
        id
        name
        crew
        MGLT
        model
        length
        edited
        created
        passengers
        consumables
        starshipClass
        manufacturers
        costInCredits
        cargoCapacity
        maxAtmospheringSpeed
        filmConnection {
          edges {
            node {
              id
              title
            }
          }
        }
        pilotConnection {
          edges {
            node {
              id
              name
            }
          }
        }
        hyperdriveRating
      } 
    }"}

    url = HTTParty.post('https://swapi-graphql-integracion-t3.herokuapp.com',
      body: body_ship)
    
    response = JSON.parse(url.to_json)
    @ship = response["data"]["starship"]

  end

end
