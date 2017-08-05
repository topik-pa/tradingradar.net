require 'test_helper'

class AnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis = analyses(:one)
  end

  test "should get index" do
    get analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_url
    assert_response :success
  end

  test "should create analysis" do
    assert_difference('Analysis.count') do
      post analyses_url, params: { analysis: { borsa_italiana_fta: @analysis.borsa_italiana_fta, borsa_italiana_resistance: @analysis.borsa_italiana_resistance, borsa_italiana_support: @analysis.borsa_italiana_support, investing_dotcomrating: @analysis.investing_dotcomrating, isin: @analysis.isin, repubblica_resistance: @analysis.repubblica_resistance, repubblica_support: @analysis.repubblica_support, xxivore_ftaindex: @analysis.xxivore_ftaindex, xxivore_rsi: @analysis.xxivore_rsi, xxivore_rsiDiv: @analysis.xxivore_rsiDiv, xxivore_resistance: @analysis.xxivore_resistance, xxivore_shorttrend: @analysis.xxivore_shorttrend, xxivore_support: @analysis.xxivore_support } }
    end

    assert_redirected_to analysis_url(Analysis.last)
  end

  test "should show analysis" do
    get analysis_url(@analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_url(@analysis)
    assert_response :success
  end

  test "should update analysis" do
    patch analysis_url(@analysis), params: { analysis: { borsa_italiana_fta: @analysis.borsa_italiana_fta, borsa_italiana_resistance: @analysis.borsa_italiana_resistance, borsa_italiana_support: @analysis.borsa_italiana_support, investing_dotcomrating: @analysis.investing_dotcomrating, isin: @analysis.isin, repubblica_resistance: @analysis.repubblica_resistance, repubblica_support: @analysis.repubblica_support, xxivore_ftaindex: @analysis.xxivore_ftaindex, xxivore_rsi: @analysis.xxivore_rsi, xxivore_rsiDiv: @analysis.xxivore_rsiDiv, xxivore_resistance: @analysis.xxivore_resistance, xxivore_shorttrend: @analysis.xxivore_shorttrend, xxivore_support: @analysis.xxivore_support } }
    assert_redirected_to analysis_url(@analysis)
  end

  test "should destroy analysis" do
    assert_difference('Analysis.count', -1) do
      delete analysis_url(@analysis)
    end

    assert_redirected_to analyses_url
  end
end
