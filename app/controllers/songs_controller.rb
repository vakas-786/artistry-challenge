class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all 
    end 

    def show 
    end 

    def new
        @song = Song.new 
        @artists = Artist.all 
        @instruments = Instrument.all 
    end  

    def edit
    end 

    def create
        @song = Song.create(song_params)
        if @song.valid? 
            redirect_to artists_path 
        else 
            Flash[:errors] = @song.errors.full_messages 
            redirect_to new_song_path 
        end 
    end 

    def update 
        if @song.update(song_params)
            redirect_to song_path(@song)
        else 
            Flash[:errors] = @song.errors.full_messages 
            redirect_to edit_song_path 
        end 
    end 

    def destroy 
        @song.destroy 
        redirect_to songs_path 
    end 

    private 

    def song_params 
        params.require(:song).permit(:artist_id, :instrument_id)
    end 

    def set_song
        @song = Song.find(params[:id])
    end 
end
