class CriptocurrencyHistoriesController < InheritedResources::Base


  private

    def criptocurrency_history_params
      params.require(:criptocurrency_history).permit(:name)
    end
end

