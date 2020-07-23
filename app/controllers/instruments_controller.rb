class InstrumentsController < ApplicationController
    before_action :set_instrument, only: [:show, :edit, :update, :destroy]

    def index
        @instruments = Instrument.all 
    end 

    def show 
    end 

    def new
        @instrument = Instrument.new 
    end  

    def edit
    end 

    def create
        @instrument = Instrument.create(instrument_params)
        if @instrument.valid? 
            redirect_to instrument_path(@instrument)
        else 
            Flash[:errors] = @instrument.errors.full_messages 
            redirect_to new_instrument_path 
        end 
    end 

    def update 
        if @instrument.update(instrument_params)
            redirect_to instrument_path(@instrument)
        else 
            Flash[:errors] = @instrument.errors.full_messages 
            redirect_to edit_instrument_path 
        end 
    end 

    def destroy 
        @instrument.destroy 
        redirect_to instruments_path 
    end 

    private 

    def instrument_params 
        params.require(:instrument).permit(:name, :classification)
    end 

    def set_instrument
        @instrument = Instrument.find(params[:id])
    end 
end
