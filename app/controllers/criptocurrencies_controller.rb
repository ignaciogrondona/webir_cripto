class CriptocurrenciesController < InheritedResources::Base

  private

    def criptocurrency_params
      params.require(:criptocurrency).permit(:name)
    end
end

