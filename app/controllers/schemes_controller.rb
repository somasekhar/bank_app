class SchemesController < ApplicationController

  # =begin
  #   @api {get} /emi-schemes List
  #   @apiVersion 0.0.1
  #   @apiName List
  #   @apiGroup Emi Schemes - Bank
  #   @apiDescription Emi Schemes API to get list of emi schemes of all banks
  #
  #   @apiHeader {String} Content-Type application/json
  #
  #   @apiParam {Number} amount.
  #   @apiParam {String} page page number request, default is 1
  #   @apiParam {String} per_page maximum result per request, default is 5
  #   @apiSuccessExample {json} Success-Response:
  # [
  #     {
  #         "bank": "HDFC",
  #         "tenures": [
  #                     {
  #                       "months": 3,
  #                       "rate": 13,
  #                       "minimum_amount": 3000
  #                     }
  #                    ]
  #     }
  # ]
  #   @apiError 500 Error from system
  #   =end
  def index
    amount = params[:amount]
    query_hash = amount.present? ? {tenures: { minimum_amount: amount }} : {}
    banks = Bank.includes(:tenures).where(query_hash).page(params[:page]).per(5)
    render json: banks, :root => false
  end


  # =begin
  #   @api {get} /import-banks-data List
  #   @apiVersion 0.0.1
  #   @apiName List
  #   @apiGroup Bank Data - Bank
  #   @apiDescription Create all banks and tenure data from csv
  #
  #   @apiHeader {String} Content-Type application/json
  #
  #   @apiParam {String} page page number request, default is 1
  #   @apiSuccessExample {json} Success-Response:
  # {
  #   "total_rows": 31,
  #   "error": []
  # }
  #   @apiError 500 Error from system
  #   =end

  def import_banks_data
    ProcessBanksData.process! do |process|
      render json: {total_rows: process.total_rows, error: process.errors}
    end
  end

end
