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
      post studies_url, params: { study: { buy: @study.buy, continuation_candlestick: @study.continuation_candlestick, continuation_chart_pattern: @study.continuation_chart_pattern, direction: @study.direction, gap: @study.gap, image_usrl: @study.image_usrl, macd: @study.macd, macd_cross: @study.macd_cross, mmp1: @study.mmp1, mmp2: @study.mmp2, note: @study.note, resistance: @study.resistance, reversal_candlestick: @study.reversal_candlestick, reversal_chart_pattern: @study.reversal_chart_pattern, rsi: @study.rsi, rsi_cross: @study.rsi_cross, rsi_divergence: @study.rsi_divergence, sell: @study.sell, stoch: @study.stoch, stoch_cross: @study.stoch_cross, stoch_divergence: @study.stoch_divergence, stock_id: @study.stock_id, stop_loss: @study.stop_loss, support: @study.support, trading_position: @study.trading_position, user_id: @study.user_id } }
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
    patch study_url(@study), params: { study: { buy: @study.buy, continuation_candlestick: @study.continuation_candlestick, continuation_chart_pattern: @study.continuation_chart_pattern, direction: @study.direction, gap: @study.gap, image_usrl: @study.image_usrl, macd: @study.macd, macd_cross: @study.macd_cross, mmp1: @study.mmp1, mmp2: @study.mmp2, note: @study.note, resistance: @study.resistance, reversal_candlestick: @study.reversal_candlestick, reversal_chart_pattern: @study.reversal_chart_pattern, rsi: @study.rsi, rsi_cross: @study.rsi_cross, rsi_divergence: @study.rsi_divergence, sell: @study.sell, stoch: @study.stoch, stoch_cross: @study.stoch_cross, stoch_divergence: @study.stoch_divergence, stock_id: @study.stock_id, stop_loss: @study.stop_loss, support: @study.support, trading_position: @study.trading_position, user_id: @study.user_id } }
    assert_redirected_to study_url(@study)
  end

  test "should destroy study" do
    assert_difference('Study.count', -1) do
      delete study_url(@study)
    end

    assert_redirected_to studies_url
  end
end
