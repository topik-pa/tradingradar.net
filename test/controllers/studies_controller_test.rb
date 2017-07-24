require 'test_helper'

class StudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study = studies(:one)
  end

  test "should get index" do
    get studies_url
    assert_response :success
  end

  test "should get new" do
    get new_study_url
    assert_response :success
  end

  test "should create study" do
    assert_difference('Study.count') do
      post studies_url, params: { study: { buy: @study.buy, continuationCandlestick: @study.continuationCandlestick, continuationChartPattern: @study.continuationChartPattern, direction: @study.direction, gap: @study.gap, imageUrl: @study.imageUrl, macd: @study.macd, macdCross: @study.macdCross, mmp1: @study.mmp1, mmp2: @study.mmp2, note: @study.note, resistance: @study.resistance, reversalCandlestick: @study.reversalCandlestick, reversalChartPattern: @study.reversalChartPattern, rsi: @study.rsi, rsiCross: @study.rsiCross, rsiDivergence: @study.rsiDivergence, sell: @study.sell, stoch: @study.stoch, stochCross: @study.stochCross, stochDivergence: @study.stochDivergence, stock_id: @study.stock_id, stopLoss: @study.stopLoss, support: @study.support, tradingPosition: @study.tradingPosition, user_id: @study.user_id } }
    end

    assert_redirected_to study_url(Study.last)
  end

  test "should show study" do
    get study_url(@study)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_url(@study)
    assert_response :success
  end

  test "should update study" do
    patch study_url(@study), params: { study: { buy: @study.buy, continuationCandlestick: @study.continuationCandlestick, continuationChartPattern: @study.continuationChartPattern, direction: @study.direction, gap: @study.gap, imageUrl: @study.imageUrl, macd: @study.macd, macdCross: @study.macdCross, mmp1: @study.mmp1, mmp2: @study.mmp2, note: @study.note, resistance: @study.resistance, reversalCandlestick: @study.reversalCandlestick, reversalChartPattern: @study.reversalChartPattern, rsi: @study.rsi, rsiCross: @study.rsiCross, rsiDivergence: @study.rsiDivergence, sell: @study.sell, stoch: @study.stoch, stochCross: @study.stochCross, stochDivergence: @study.stochDivergence, stock_id: @study.stock_id, stopLoss: @study.stopLoss, support: @study.support, tradingPosition: @study.tradingPosition, user_id: @study.user_id } }
    assert_redirected_to study_url(@study)
  end

  test "should destroy study" do
    assert_difference('Study.count', -1) do
      delete study_url(@study)
    end

    assert_redirected_to studies_url
  end
end
