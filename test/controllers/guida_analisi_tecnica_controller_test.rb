require 'test_helper'

class GuidaAnalisiTecnicaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guida_analisi_tecnica_index_url
    assert_response :success
  end

  test "should get leFasiDelMercato" do
    get guida_analisi_tecnica_leFasiDelMercato_url
    assert_response :success
  end

  test "should get ilTrend" do
    get guida_analisi_tecnica_ilTrend_url
    assert_response :success
  end

  test "should get laTrendline" do
    get guida_analisi_tecnica_laTrendline_url
    assert_response :success
  end

  test "should get inversioneDiTrend" do
    get guida_analisi_tecnica_inversioneDiTrend_url
    assert_response :success
  end

  test "should get figureGrafiche" do
    get guida_analisi_tecnica_figureGrafiche_url
    assert_response :success
  end

  test "should get testaESpalla" do
    get guida_analisi_tecnica_testaESpalla_url
    assert_response :success
  end

  test "should get doppioTriploMinimoMassimo" do
    get guida_analisi_tecnica_doppioTriploMinimoMassimo_url
    assert_response :success
  end

  test "should get spike" do
    get guida_analisi_tecnica_spike_url
    assert_response :success
  end

  test "should get triangoliFlagPennantRettangoli" do
    get guida_analisi_tecnica_triangoliFlagPennantRettangoli_url
    assert_response :success
  end

  test "should get candeleGiapponesi" do
    get guida_analisi_tecnica_candeleGiapponesi_url
    assert_response :success
  end

  test "should get standardELong" do
    get guida_analisi_tecnica_standardELong_url
    assert_response :success
  end

  test "should get marubozu" do
    get guida_analisi_tecnica_marubozu_url
    assert_response :success
  end

  test "should get harami" do
    get guida_analisi_tecnica_harami_url
    assert_response :success
  end

  test "should get doji" do
    get guida_analisi_tecnica_doji_url
    assert_response :success
  end

  test "should get configurazioniCandlestick" do
    get guida_analisi_tecnica_configurazioniCandlestick_url
    assert_response :success
  end

  test "should get bullishBearishEngulfing" do
    get guida_analisi_tecnica_bullishBearishEngulfing_url
    assert_response :success
  end

  test "should get morningEveningStar" do
    get guida_analisi_tecnica_morningEveningStar_url
    assert_response :success
  end

  test "should get hammerShootingStar" do
    get guida_analisi_tecnica_hammerShootingStar_url
    assert_response :success
  end

  test "should get hangingMan" do
    get guida_analisi_tecnica_hangingMan_url
    assert_response :success
  end

  test "should get gap" do
    get guida_analisi_tecnica_gap_url
    assert_response :success
  end

  test "should get oscillatori" do
    get guida_analisi_tecnica_oscillatori_url
    assert_response :success
  end

  test "should get rsi" do
    get guida_analisi_tecnica_rsi_url
    assert_response :success
  end

  test "should get macd" do
    get guida_analisi_tecnica_macd_url
    assert_response :success
  end

  test "should get stocastico" do
    get guida_analisi_tecnica_stocastico_url
    assert_response :success
  end

  test "should get bandeDiBollinger" do
    get guida_analisi_tecnica_bandeDiBollinger_url
    assert_response :success
  end

  test "should get indicatori" do
    get guida_analisi_tecnica_indicatori_url
    assert_response :success
  end

  test "should get medieMobili" do
    get guida_analisi_tecnica_medieMobili_url
    assert_response :success
  end

  test "should get volumi" do
    get guida_analisi_tecnica_volumi_url
    assert_response :success
  end

  test "should get ondeDiElliot" do
    get guida_analisi_tecnica_ondeDiElliot_url
    assert_response :success
  end

  test "should get ritracciamentiDiFibonacci" do
    get guida_analisi_tecnica_ritracciamentiDiFibonacci_url
    assert_response :success
  end

end
