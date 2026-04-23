% EndoCred QPM for Armenia
% Originally developed by Ani Asoyan
% Copyright (C) 2026 Ani Asoyan
% Licensed under the GNU Affero General Public License v3.0
% https://www.gnu.org/licenses/agpl-3.0.html

// =0 runs nonlinear convex Phillips curve
// To switch to the linear Phillips curve, set nonlinearPC=1 or anything else except 0
@#define nonlinearPC=0

// =0 switches on the long run real interest rate gap and term premiums in Output Gap equations
// To switch to the short run real interest rate gap, set longtermprem=1 or anything else except 0
@#define longtermprem=0


// This Block defines endogenous variables of the model
//    Dynare Notation         Latex Notation                   Explaination of the Defined Variables
var     
      PIE_NTSPI               ${\pi^{ntspi}$                   (long_name = 'QoQ Annualized Sticky Inflation')   
      PIE_REG                 ${\pi^{reg}}$                    (long_name = 'QoQ Annualized Regulated Services Inflation')
      PIE_FLEX                ${\pi^{flex}}$                   (long_name = 'Qoq Annualized Flexible Inflation')
      PIE_HEADLINE            ${\pi^{CPI}}$                    (long_name = 'QoQ Annualized Headline Inflation')
      PIE4_NTSPI              ${\pi4^{ntspi}$                  (long_name = 'Moving Average of 4 Quarters QoQ NTSPI')    
      PIE4_HEADLINE           ${\pi4^{CPI}}$                   (long_name = 'Moving Average of 4 Quarters QoQ Headline Inflation')
      PIE_imp                 ${\pi^{imp}}$                    (long_name = 'Imported Inflation')
      PIE_food_imp            ${\pi^{food-imp}}$               (long_name = 'Imported Food Inflation')
      PIE_oil_imp             ${\pi^{oil-imp}}$                (long_name = 'Imported Oil Inflation')
      PIE_PRT                 ${\pi^{prt}}$                    (long_name = 'Partners excluding USA Inflation in Respective Currencies')
      PIE_F                   ${\pi^F}$                        (long_name = 'Foreign Inflation')

      RMC_NTSPI               ${RMC^{ntspi}}$                  (long_name = 'Real Marginal Cost of NTSPI')
      RMC_REG                 ${\RMC^{reg}}$                   (long_name = 'Real Marginal Cost of Regulated Services Inflation')
      RMC_FLEX                ${\RMC^{flex}}$                  (long_name = 'Real Marginal Cost of Flexible Inflation')
      P_NTSPI                 $P^{ntspi}$                      (long_name = 'Non Traded Sticky Price Level')
      P
      P_REG                   $P^{reg}$                        (long_name = 'Regulative Services Price Level')
      P_FLEX                  $P^{flex}$                       (long_name = 'Flexible Price Level')
      P_food_imp              ${P^{food-imp}}$                 (long_name = 'Imported Food Prices')
      P_oil_imp               ${P^{oil-imp}}$                  (long_name = 'Imported Oil Prices')
      P_PRT                   ${P^{prt}}$                      (long_name = 'Partners Excluding USA CPI in Respective Currencies')
      P_F                     ${P^F}$                          (long_name = 'Foreign Inflation')

      RP_REG                  $RP^{reg}$                       (long_name = 'Relative Price of Regulative Services vs Headline')
      RP_FLEX                 $RP^{flex}$                      (long_name = 'Relative Flexible Price vs Headline')
      RP_REG_t                $\bar{RP^{reg}}$                 (long_name = 'Regulative Services Relative Price Trend')
      gRP_REG_t               $\bar{gRP^{reg}}$                (long_name = 'Persistence in Regulated Services Relative Price Trend')
      RP_REG_g                $\hat{RP^{reg}}$                 (long_name = 'Regulative Services Relative Price Gap')
      RP_FLEX_t               $\bar{RP^{flex}}$                (long_name = 'Flexible Relative Price Trend')
      gRP_FLEX_t              $\bar{gRP^{flex}}$               (long_name = 'Persistence in the trend of flexible relative price')
      RP_FLEX_g               $\hat{RP^{flex}}$                (long_name = 'Flexible Relative Price Gap')
      qoil                    $qoil$                           (long_name = 'Real Price of Oil')           
      qoil_t                  $\bar{qoil}$                     (long_name = 'Trend in Real Price of Oil')
      d_qoil_t                $\bar{\Delta{qoil}}$             (long_name = 'QoQ Annualized Growth of Oil Price Trend')
      qoil_g                  $\hat{qoil}$                     (long_name = 'Gap of Real Price of Oil')
      PFoil                   $PF^{oil}$                       (long_name = 'Price of Oil')
      qfood                   $qfood$                          (long_name = 'Real Price of Food')
      qfood_t                 $\bar{qfood}$                    (long_name = 'Trend of Real Price of Food')
      d_qfood_t               $\bar{\Delta{qfood}}$            (long_name = 'QoQ Annualized Growth in Real Food Price Trend')
      qfood_g                 $\hat{qfood}$                    (long_name = 'Gap of Real Price of Food')
      PFfood                  $PF^{food}$                      (long_name = 'Price of Food')
      EPS_PIE_NTSPI           ${EPS^{\pi}}$                    (long_name = 'Serially Correlated Sticky Inflation Shock')
      PIE_NTSPI_EXP           ${\pi^{exp}}$                    (long_name = 'Non traded Sticky Price Inflation Expectations')   
      P_HEADLINE              $P^{CPI}$                        (long_name = 'Headline CPI')
      PIE_DEV_TAR             ${\varepsilon^{TAR}}$            (long_name = 'Deviation of Inflation from Optimistic Expectations')
      PIE_DEV_HIGH            ${\varepsilon^{HIGH}}$           (long_name = 'Deviation of Inflation from Expectations Towards High Inflation Regime')
      PIE_DEV_LOW             ${\varepsilon^{LOW}}$            (long_name = 'Deviation of Inflation from Expectations Towards Low Inflation Trap')
      P_HIGH                  ${P^{HIGH}}$                     (long_name = 'Probability of High Inflation Regime')
      P_LOW                   ${P^{LOW}}$                      (long_name = 'Probability of Low Inflation Regime')
      C_FLOW                  ${C^{FLOW}}$                     (long_name = 'Flow of Credibility')
      C                       ${C}$                            (long_name = 'Credibility')
      EPS_PIE_NTSPI_EXP       ${EPS^{exp}}$                    (long_name = 'Serially Correlated Non-Traded Sticky Inflation Expectations Shock')
      EPS_C                   ${EPS^C}$                        (long_name = 'Serially Correlated Credibility Shock')
      PIE_STAR                ${\pi^*}$                        (long_name = 'Time Varying Inflation Target')
      Y                       ${\hat{Y}}$                      (long_name = 'Output Gap')
      RR_GAP                  ${\hat{RR}}$                     (long_name = 'Real Interest Rate Gap')
      Y_WORLD                 ${\hat{Y^W}}$                    (long_name = 'World Output Gap') 
      EPS_Y                   ${EPS^{\hat{Y}}}$                (long_name = 'Serially Correlated Output Gap Shock') 
      CUMSUMY                 ${CUM^{\hat{Y}}}$                (long_name = 'Cummulative Output Gap')
      DL_GDP                  ${\Delta{GDP}}$                  (long_name = 'Q-o-Q Annualized Log Growth of Real GDP')
      DL_GDP_BAR              ${\bar{\Delta{GDP}}}$            (long_name = 'Q-o-Q Annualized Log Growth of Potential GDP')
      G_GDP_BAR               ${\bar{gGDP}$                    (long_name = 'Persistence in Potential GDP')
      UNR_GAP                 ${\hat{U}}$                      (long_name = 'Unemployment Gap')
      UNR_BAR                 ${\bar{U}}$                      (long_name = 'NAIRU')
      UNR                     ${U}$                            (long_name = 'Unemployment Rate')
      G_UNR                   ${\bar{gU}}$                     (long_name = 'Persistent Component in NAIRU')
      EPS_UNR_BAR             ${EPS^{\bar{U}}$                 (long_name = 'Serially Correlated NAIRU Shock')
      RS                      $RS$                             (long_name = 'Policy Rate')
      TERM6M                  ${Term2}$                        (long_name = '6-Month Term Premium')
      TERM1Y                  ${Term4}$                        (long_name = '1-Year Term Premium')
      TERM2Y                  ${Term8}$                        (long_name = '2-Year Term Premium')
      TERM3Y                  ${Term12}$                       (long_name = '3-Year Term Premium')
      TERM5Y                  ${Term20}$                       (long_name = '5-Year Term Premium')
      TERM10Y                 ${Term40}$                       (long_name = '10-Year Term Premium')
      RR                      ${RR}$                           (long_name = 'Short Term Real Interest Rate') 
      RR_BAR                  ${\bar{RR}}$                     (long_name = 'Real Interest Rate Trend')
  

      EFF_RS                  ${RS^{eff}}$                     (long_name = 'Effective Nominal Interest Rate')
      EFF_RR                  ${RR^{eff}}$                     (long_name = 'Effective Real Rate')
      EFF_RR_g                ${\hat{RR^{eff}}}$               (long_name = 'Effective Real Rate Gap')
      EFF_RR_BAR              ${\bar{RR^{eff}}}$               (long_name = 'Effective Reat Rate Trend')

      sigma                   $\sigma$                         (long_name = 'Dollarization parameter')

      EFF_RR6m                $RR2^{eff}$                      (long_name = '6-Month Expected Effective Real Interest Rate')
      EFF_RR4                 $RR4^{eff}$                      (long_name = '1-Year Expected Effective Real Interest Rate')
      EFF_RR12                $RR12^{eff}$                     (long_name = '3-Year Expected Effective Real Interest Rate')
      EFF_RR20                $RR20^{eff}$                     (long_name = '5-Year Expected Effective Real Interest Rate')
      EFF_RR40                $RR40^{eff}$                     (long_name = '10-Year Expected Effective Real Interest Rate')
      EFF_RR_BAR6m            $\bar{RR2^{eff}}$                (long_name = '6-Month Expected Effective Real Interest Rate Trend')
      EFF_RR_BAR4             $\bar{RR4^{eff}}$                (long_name = '1-Year Expected Effective Real Interest Rate Trend')
      EFF_RR_BAR12            $\bar{RR12^{eff}}$               (long_name = '3-Year Expected Effective Real Interest Rate Trend')
      EFF_RR_BAR20            $\bar{RR20^{eff}}$               (long_name = '5-Year Expected Effective Real Interest Rate Trend')
      EFF_RR_BAR40            $\bar{RR40^{eff}}$               (long_name = '10-Year Expected Effective Real Interest Rate Trend')
      EFF_LR                  $LR^{eff}$                       (long_name = 'Long-run Effective Real Interes Rate')
      EFF_LR_BAR              $\bar{LR^{eff}}$                 (long_name = 'Long-run Effective Real Interest Rate Trend')
      EFF_LR_GAP              $\hat{LR^{eff}}$                 (long_name = 'Long-run Effective Real Interest Rate Gap')

      EPS_RS                  ${EPS^{RS}}$                     (long_name = 'Serially Correlated Monetary Policy Shock')
      LOSS                    ${LOSS}$                         (long_name = 'Loss Function')
      PIE_GAP                 ${\pi^{gap}}$                    (long_name = 'Inflation Deviation from its Target')
      DRS                     ${\Delta{RS}}$                   (long_name = 'Swings in Policy Rate')
      P_GAP                   ${P^{gap}}$                      (long_name = 'Price Level Gap')
      DC                      ${\Delta{C}}$                    (long_name = 'Changes in Credibility')
      YNEG                    ${\hat{Y^{neg}}}$                (long_name = 'Negative Output Gap')
      PGAPNEG                 ${P^{ngap}}$                     (long_name = 'Negative Price Level Gap')
      DCNEG                   $\Delta{C}^{neg}$                (long_name = 'Negative Changes in Credibility')

      PREM                    $PREM$                           (long_name = 'Risk Premium')
      RR_US                   $RR^{US}$                        (long_name = 'US Real Interest Rate')
      RS_US                   $RS^{US}$                        (long_name = 'US Interest Rate')
      RR_BAR_US               $\bar{RR}^{US}$                  (long_name = 'US Real Neutral Rate')
      PREM_BAR                $\bar{PREM}$                     (long_name = 'Risk Premium Trend')
      FX_PREM                 ${fxPREM}$                       (long_name = 'Liquidity Risk Premium')
      PIE_US                  $\pi^{US}$                       (long_name = 'US Inflation')
      P_US                    $P^{US}$                         (long_name = 'US Price Level')
      
      Z                       $Z$                              (long_name = 'Real Exchange Rate')
      Z_g                     $\hat{Z}$                        (long_name = 'Real Exchange Rate Gap')
      Z_t                     $\bar{Z}$                        (long_name = 'Real Exchange Rate Gap')
      dZ                      $\Delta{Z}$                      (long_name = 'RER Depreciation')
      dZ_t                    $\Delta{\bar{Z}}$                (long_name = 'RER Trend Depreciation')
      Z_US                    $Z^{US}$                         (long_name = 'RER vs US')
      Z_US_g                  $\hat{Z^{US}}$                   (long_name = 'RER Gap vs US')
      Z_US_t                  $\bar{Z^{US}}$                   (long_name = 'RER Trend vs US')
      dZ_US                   $\Delta{Z}^{US}$                 (long_name = 'Change in RER vs US')
      dZ_US_t                 $\bar{\Delta{Z}^{US}}$           (long_name = 'RER Trend Depreciation vs US')
      Z_PRT                   $Z^{prt}$                        (long_name = 'RER Partners vs USA / increase is appreciation of USD')
      Z_PRT_g                 $\hat{Z^{PRT}}$                  (long_name = 'RER Gap Partners vs USA')
      Z_PRT_t                 $\bar{Z^{PRT}}$                  (long_name = 'RER Trend Partners vs USA')
      dZ_PRT                  $\Delta{Z}^{PRT}$                (long_name = 'RER Depreciation Partners vs USA')
      dZ_PRT_t                $\bar{\Delta{Z}^{PRT}}$          (long_name = 'RER Trend Depreciation Partners vs USA')
      S                       $S$                              (long_name = 'Nominal Exchange Rate')
      dS                      $\Delta{S}$                      (long_name = 'Nominal Exchange Rate Depreciation')
      S_exp                   $S^e$                            (long_name = 'Expected Nominal Exchange Rate')
      S_PRT                   $S^{prt}$                        (long_name = 'Nominal Exchange Rate, partners')
      dS_PRT                  $\Delta{S}^{prt}$                (long_name = 'Nominal Exchange Rate change, partners')
PIE4_FLEX
PIE4_REG
;   



// This Block Defines Exogenous variables of the model 
//   Dynare Notation          Latex Notation                       Explaination of the Defined Exogenous Variables
varexo 
      E_PIE_NTSPI             $\varepsilon^{\pi}_{ntsp}$            (long_name = 'Serially Uncorrelated Sticky Inflation Shock')
      E_EPS_PIE_NTSPI         $\varepsilon^{ntsp}_{eps}$            (long_name = 'Shock to Serially Correlated Sticky Inflation Shock')
      
      E_PIE_REG               $\varepsilon^{\pi}_{reg}$             (long_name = 'Regulated Services Inflation Shock')
      E_PIE_FLEX              $\varepsilon^{\pi}_{flex}$            (long_name = 'Flexible Inflation Shock')
      E_RPREG_t               $\varepsilon^{RP}_{reg}$              (long_name = 'Shock to Regulated Services Relative Price Trend')
      E_RPFLEX_t              $\varepsilon^{RP}_{flex}$             (long_name = 'Shock to Flexible Relative Price Trend')

      E_gRPREGt               $\varepsilon^{gRP}_{reg}$             (long_name = 'Persistence Shock to Regulated Services Relative Price Trend')
      E_gRPFLEXt              $\varepsilon^{gRP}_{flex}$            (long_name = 'Persistence Shock to Flexible Relative Price Trend')
      E_d_qoil_t              $\varepsilon^{dqt}_{oil}$             (long_name = 'Shock to Growth of Oil Price Trend')
      E_d_qfood_t             $\varepsilon^{dqt}_{food}$            (long_name = 'Shock to Growth of Food Price Trend')
      E_qoil_g                $\varepsilon^{qg}_{oil}$              (long_name = 'Shock to Oil Price Gap')
      E_qfood_g               $\varepsilon^{qg}_{food}$             (long_name = 'Shock to Food Price Gap')

      E_C                     $\varepsilon^C$                       (long_name = 'Serially Uncorrelated Credibility Shock')
      E_EPS_C                 $\varepsilon^{C}_{eps}$               (long_name = 'Shock to Serially Correlated Credibility Shock')

      E_PIE_NTSPI_EXP         $\varepsilon^{ntsp,e}$                (long_name = 'Serially Uncorrelated Inflation Expectations Shock')
      E_EPS_PIE_NTSPI_EXP     $\varepsilon^{ntsp,e}_{eps}$          (long_name = 'Shock to Serially Correlated Inflation Expectations Shock')

      E_PIESTAR               $\varepsilon^{\pi^*}$                 (long_name = 'Shock to Time Varying Inflation Target')

      E_Y                     $\varepsilon^{Y}$                     (long_name = 'Serially Uncorrelated Output Gap Shock')
      E_EPS_Y                 $\varepsilon^Y_{eps}$                 (long_name = 'Shock to Serially Correlated Output Gap Shock')

      E_DL_GDP_BAR            $\varepsilon^{\bar{Y}}$               (long_name = 'Potential GDP Level Shock')
      E_G_GDP_BAR             $\varepsilon^{\bar{Y}}_G$             (long_name = 'Potential GDP Growth Shock')
      E_UNR_GAP               $\varepsilon^{\hat{U}}$               (long_name = 'Unemployment Gap Shock')
      E_UNR_BAR               $\varepsilon^{\bar{U}}$               (long_name = 'Serially Uncorrelated NAIRU Shock')
      E_UNR_G                 $\varepsilon^{U_G}$                   (long_name = 'Shock to NAIRU Persistence')
      E_EPS_UNR_BAR           $\varepsilon^{\bar{U}_{eps}}$         (long_name = 'Shock to Serially Correlated NAIRU Shock')

      E_TERM                 $\varepsilon^{{Term}}$                 (long_name = 'General Term Premium Shock')
      E_TERM6M               $\varepsilon^{{Term}_2}$             (long_name = '6-Month Term Premium Shock')
      E_TERM1Y               $\varepsilon^{{Term}_4}$             (long_name = '1-Year Term Premium Shock')
      E_TERM2Y               $\varepsilon^{{Term}_8}$             (long_name = '2-Year Term Premium Shock')
      E_TERM3Y               $\varepsilon^{{Term}_12}$              (long_name = '3-Year Term Premium Shock')
      E_TERM5Y               $\varepsilon^{{Term}_20}$            (long_name = '5-Year Term Premium Shock')
      E_TERM10Y              $\varepsilon^{{Term}_40}$            (long_name = '10-Year Term Premium Shock')
     
      E_RR_BAR               $\varepsilon^{\bar{RR}}$               (long_name = 'Serially Uncorrelated Shock to Real Neutral Rate')
      E_EPS_RS               $\varepsilon^{RS}_{eps}$               (long_name = 'Shock to Serially Correlated Monetary Policy Shock')

      E_PREM                 $\varepsilon^{PREM}$                   (long_name = 'Shock to Risk Premium')
      E_FX_PREM              $\varepsilon^{fxPREM}$                 (long_name = 'Shock to Liquidity Risk Premium')
      E_RR_BAR_US            $\varepsilon^{\bar{RR}}_{US}$          (long_name = 'Shock to US Real Neutral Rate')
      E_Y_WORLD              $\varepsilon^{Y^*}$                    (long_name = 'Shock to World Output Gap')
      E_RR_US                $\varepsilon^{RR}_{US}$                (long_name = 'Shock to US Real Interest Rate')
      E_RS_US                $\varepsilon^{RS}_{US}$                (long_name = 'Shock to US Nominal Interest Rate')
      E_PREM_BAR             $\varepsilon^{\bar{PREM}}$             (long_name = 'Shock to Risk Premium Trend')
      E_PIE_US               $\varepsilon^{\pi}_{US}$               (long_name = 'Shock to US Inflation')
      E_PIE_PRT              $\varepsilon^{\pi}_{prt}$              (long_name = 'Shock to Partners Inflation')

      E_Z_t                  $\varepsilon^{\bar{Z}}$                (long_name = 'Shock to RER Trend')
      E_dZ_t                 $\varepsilon^{d\bar{Z}}$               (long_name = 'Shock to RER Trend Depreciation')
      E_dZ_PRT_t             $\varepsilon^{d\bar{Z}}_{prt}$         (long_name = 'Shock to Partners RER Trend Depreciation')
      E_Z_PRT_g              $\varepsilon^{\hat{Z}}_{prt}$          (long_name = 'Shock to Partners RER gap')
      E_S                    $\varepsilon^S$                        (long_name = 'Shock to Nominal Exchange Rate')
      E_EFF_RR_BAR           $\varepsilon^{\bar{RR}}_{eff}$         (long_name = 'Shock to Effective Real Interest Rate Trend')            
;



// This Block defines parameters of the model
//    Dynare Notation         Latex Notation                   Explaination of the Defined Parameter
parameters 
      n_alpha1                $\alpha^n_1$                     (long_name = 'Persistence in NTSPI PC')
      n_alpha2                $\alpha^n_2$                     (long_name = 'Coefficient of RMC in NTSPI PC')
      n_alpha3                $\alpha^n_3$                     (long_name = 'Weight on the output gap in the NTSPI RMC vs the relative NTSPI price gap')
      r_alpha1                $\alpha^r_1$                     (long_name = 'Coefficient of Inflation Target in Regulated Services PC')
      r_alpha2                $\alpha^r_2$                     (long_name = 'Coefficient on RMC under Regulated Services prices in the Regulated Service-price PC')
      f_alpha1                $\alpha^f_1$                     (long_name = 'Persistence in Flexible-Price PC')
      f_alpha2                $\alpha^f_2$                     (long_name = 'Coefficient on RMC Under Flexible Prices in the Flexible-Price PC')
      f_alpha3                $\alpha^f_3$                     (long_name = 'Coefficient of Imported Inflatoin in Flexible-Price PC')
      f_alpha4                $\alpha^f_4$                     (long_name = 'Coefficient of Imported Food Inflatoin in Flexible-Price PC')
      f_alpha5                $\alpha^f_5$                     (long_name = 'Coefficient of Imported Oil Inflatoin in Flexible-Price PC')
      f_alpha6                $\alpha^f_6$                     (long_name = 'Coefficient of Relative Flexible Price Gap in Flexible RMC')
      f_alpha7                $\alpha^f_7$                     (long_name = 'Coefficient of Output Gap in Flexible RMC')
      f_alpha8                $\alpha^f_8$                     (long_name = 'Coefficient of RER Gap vs US in Flexible RMC')
      f_alpha9                $\alpha^f_9$                     (long_name = 'Coefficient of RER Change Deviation from SS trend in Flexible RMC')
      f_alpha10               $\alpha^f_10$                    (long_name = 'Coefficient of Real Oil Price Gap in Flexible RMC')
      f_alpha11               $\alpha^f_11$                    (long_name = 'Coefficient of Real Food Price Gap in Flexible RMC')
    
      alpha1_oil              $\alpha^{oil}_1$                 (long_name = 'Persistence in Real oil price trend growth')
      alpha2_oil              $\alpha^{oil}_2$                 (long_name = 'Persistence in Real oil price gap')
      alpha1_food             $\alpha^{food}_1$                (long_name = 'Persistence in Real food price trend growth')
      alpha2_food             $\alpha^{food}_2$                (long_name = 'Persistence in Real food price gap')
    
      w_ntspi                 $w_{ntspi}$                      (long_name = 'NTSPI weight in Headline')
      w_reg                   $w_{reg}$                        (long_name = 'Weight of Regulated Prices in Headline')

      d_qoil_ss               $d\bar{qoil}^{ss}$               (long_name = 'Steady State of Oil Price trend growth')
      d_qfood_ss              $d\bar{qfood}^{ss}$              (long_name = 'Steady State of Food Price trend growth')
      EXCH_TREND_SS           $d\bar{REER}^{ss}$               (long_name = 'Steady State REER Trend Quarterly Depreciation')

      gamma_1                 $\gamma_1$                       (long_name = 'Persistence of Sticky Inflation Shock')
      gamma_2                 $\gamma_2$                       (long_name = 'Persistence of Credibility Shock')
      gamma_3                 $\gamma_3$                       (long_name = 'Persistence of Inflation Expectations Shock')
      gamma_4                 $\gamma_4$                       (long_name = 'Persistence in Output Gap Shock')
      gamma_5                 $\gamma_5$                       (long_name = 'Persistence in NAIRU Shock')
      gamma_6                 $\gamma_6$                       (long_name = 'Persistence in Monetary Policy Shock')

      delta                   $\delta$                         (long_name = 'Credibility Persistence Parameter')
      delta_1                 $\delta_1$                       (long_name = 'Inflation Persistence under Optimistic Expectations')
      delta_2                 $\delta_2$                       (long_name = 'Inflation Persistence under Expectations of High Inflation Regime')
      delta_3                 $\delta_3$                       (long_name = 'Inflation Persistence under Expectations of Low Inflation Trap')
      delta_4                 $\delta_4$                       (long_name = 'Persistence in Inflation Target')

      PIEDOUBLESTAR           $\pi^{**}$                       (long_name = 'Inflation Target')
      PIE_HIGH                $\pi^{high}$                     (long_name = 'Inflation in High Inflation Regime')
      PIE_LOW                 $\pi^{low}$                      (long_name = 'Inflation in Low Inflation Trap Regime')         

      kappa_high              $\kappa^{high}$                  (long_name = 'Parameter of Inflation Bias Towards High Inflation Regime in Expectations')
      kappa_low               $\kappa^{low}$                   (long_name = 'Parameter of Inflation Bias Towards Low Inflation Regime in Expectations')

      lambda_1                $\lambda_1$                      (long_name = 'Parameter on Lead in Output Gap Equation')
      lambda_2                $\lambda_2$                      (long_name = 'Parameter on Lag in Output Gap Equation')
      lambda_3                $\lambda_3$                      (long_name = 'Parameter on SR/LR Real Interest Rate Gap in Output Gap Equation')
      lambda_4                $\lambda_4$                      (long_name = 'Parameter on Real Exchange Rate Gap in Output Gap Equation')
      lambda_5                $\lambda_5$                      (long_name = 'Parameter on World Output Gap in Output Gap Equation')
       
      theta_1                 $\theta_1$                       (long_name = 'Persistence in GDP Potential')
      theta_2                 $\theta_2$                       (long_name = 'Persistence in GDP Persistence component')
      GROWTH_SS               $\GROWTH^{ss}$                   (long_name = 'Long Run GDP Growth')
      theta_3                 $\theta_3$                       (long_name = 'Persistence in Unemployment Gap')
      theta_4                 $\theta_4$                       (long_name = 'Coefficient of Output Gap in Unemployment Gap Equation')
      theta_5                 $\theta_5$                       (long_name = 'Coefficient of Expected Output Gap in Unemployment Gap Equation')
      UNR_BAR_SS              $\bar{U}^{ss}$                   (long_name = 'Steady State Level of NAIRU')
      theta_6                 $\theta_6$                       (long_name = 'Persistence in NAIRU Persistence')

      rho_EFFR_BAR            $\rho^{eff}$                     (long_name = 'Effective Real interest rate trend persistence')
      DOLL                    $DOLL$                           (long_name = 'Dollarization response to credibility changes')
      TERM6M_SS               $term2^{ss}$                     (long_name = '6-Month Steady State Term Premium')
      TERM1Y_SS               $term4^{ss}$                     (long_name = '1-Year Steady State Term Premium')
      TERM2Y_SS               $term8^{ss}$                     (long_name = '2-Year Steady State Term Premium')
      TERM3Y_SS               $term12^{ss}$                    (long_name = '3-Year Steady State Term Premium')
      TERM5Y_SS               $term20^{ss}$                    (long_name = '5-Year Steady State Term Premium')
      TERM10Y_SS              $term40^{ss}$                    (long_name = '10-Year Steady State Term Premium')
      RHO_TERM6M              $\rho^{term2}$                   (long_name = 'Persistence in 6-Month Term Premium')
      RHO_TERM1Y              $\rho^{term4}$                   (long_name = 'Persistence in 1-Year Term Premium')
      RHO_TERM2Y              $\rho^{term8}$                   (long_name = 'Persistence in 2-Year Term Premium')
      RHO_TERM3Y              $\rho^{term12}$                  (long_name = 'Persistence in 3-Year Term Premium')
      RHO_TERM5Y              $\rho^{term20}$                  (long_name = 'Persistence in 5-Year Term Premium')
      RHO_TERM10Y             $\rho^{term40}$                  (long_name = 'Persistence in 10-Year Term Premium')
      RR_BAR_STAR             $\bar{RR}^{*}$                   (long_name = 'Steady State Real Neutral Interest Rate')

      RR_BAR_STAR_US          $\bar{RR}^{*}_{US}$              (long_name = 'US Real Equilibrium Interest Rate')                    
      PREM_BAR_STAR           $\bar{PREM}^{*}$                 (long_name = 'Equilibrium Risk Premium')

      rho_1                   $\rho_1$                         (long_name = 'Persistence in RER Trend Depreciation / Partners vs US')
      rho_2                   $\rho_2$                         (long_name = 'Persistnece in Real Exchange Rate Gap / partners vs US')
      rho_3                   $\rho_3$                         (long_name = 'Persistence in Partners Inflation')
      rho_4                   $\rho_4$                         (long_name = 'Persistence in RER /Effective/ Trend Depreciation')
      rho                     $\rho$                           (long_name = 'UIP Parameter')
      rho_5                   $\rho_5$                         (long_name = 'Lead Parameter in Expected Exchange Rate')
      rho_6                   $\rho_6$                         (long_name = 'Persistence in Country Risk Premium')
      rho_7                   $\rho_7$                         (long_name = 'Coefficient of Country Risk Bias')
      rho_8                   $\rho_8$                         (long_name = 'Persistence in Country Risk Premium Trend')
      rho_9                   $\rho_9$                         (long_name = 'Persistence in Liquidity Risk Premium')
      rho_10                  $\rho_10$                        (long_name = 'Coefficient of Liquidity Risk Bias Change')

      PIE_STAR_US             $\pi^{*}_{US}$                   (long_name = 'US Inflation Target')
      trade_AM_US             $trade^{US}$                     (long_name = 'US share in trade')

      dRP_REG_SS              $\bar{RP}^{ss}_{reg}$            (long_name = 'Steady State Relative Price of Regulated Services')
      dRP_FLEX_SS             $\bar{RP}^{ss}_{flex}$           (long_name = 'Steady State Flexible Relative Price')
      PIE_PRT_SS              $\pi_{prt}^{ss}$                 (long_name = 'Steady State Partners Inflation')
      dZ_PRT_SS               $dZ_{prt}^{ss}$                  (long_name = 'Steady State RER Depreciation Partners')
      dZ_US_t_SS              $\Delta \bar{Z}_{US}^{ss}$       (long_name = 'Steady State value for RER Trend Change vs US')
      RS_SS                   $RS^{ss}$                        (long_name = 'Steady State Nominal Interest Rate')
      sigma_min               $\sigma_{min}$                   (long_name = 'Minimum Value for Dollarization')
      RS_US_SS                $RS_{US}^{ss}$                   (long_name = 'Steady State value for Nominal Interest Rate for US')
      EFF_RR_BAR_STAR         $\bar{RR}^*_{eff}$               (long_name = 'Steady State Value for Real Effective Interest Rate Trend')
      dS_PRT_SS               $\Delta S_{prt}^{ss}$            (long_name = 'Steady State Value for NER depreciation partners')
      PIE_F_SS                $\pie_F^{ss}$                    (long_name = 'Steady State Value for foreign inflation')
      dS_SS                   $\Delta S^{ss}$                  (long_name = 'Steady State Value for Exchange rate depreciation')
;

// *** - is changed to match the latest qpm developments
// This Block calibrates the parameters 

      n_alpha1                = 0.25; //65;   // qpm=0.65, endoqpm_org=0.45
      n_alpha2                = 0.28; //35;       // qpm=0.3, endoqpm_org=0.35
      n_alpha3                = 0.6;        // qpm=0.9, endoqpm=0.4, RPgap coefficient is 0.1 in qpm      
      r_alpha1                = 1;          // old qpm
      r_alpha2                = 1.5;        // old qpm
      f_alpha1                = 0.5;        // qpm=0.3 : 0.5, endoqpm_org=0.4
      f_alpha2                = 0.2;        // qpm=0.2, endoqpm_org= 0.3 or 0.6
      f_alpha3                = 0.028;    // old qpm /1000, in endoqpm_org can be *100
      f_alpha4                = 0.012;    // old qpm /1000
      f_alpha5                = 0.01;     // old qpm /1000
      f_alpha6                = 0.24;       // qpm=0.24, endoqpm_org=1.14
      f_alpha7                = 0.8;        // qpm=0.2, endoqpm_org=0.5
      f_alpha8                = 0.03;       // qpm=0.5, new=0.05
      f_alpha9                = 0.01;       // qpm=0.2, new=0.1 
      f_alpha10               = 0.1;         
      f_alpha11               = 0.1;      


      alpha1_oil              = 0.9;
      alpha2_oil              = 0.75;
      alpha1_food             = 0.85;
      alpha2_food             = 0.75;

      w_ntspi                 = 0.1718;
      w_reg                   = 0.13;
    
      dZ_PRT_SS               = 0.1;  // ***0.13;
      PIE_PRT_SS              = 4;
      dRP_REG_SS              = 0;
      dRP_FLEX_SS             = 0;
      d_qoil_ss               = 0;
      d_qfood_ss              = 0.5;
      EXCH_TREND_SS           = -2; // ***-0.4557 ;     // endoqpm=-0.4, new=-0.4557

      gamma_1                 = 0.5;
      gamma_2                 = 0.5;
      gamma_3                 = 0.2;
      gamma_4                 = 0.5;
      gamma_5                 = 0.5;
      gamma_6                 = 0.5;

      delta                   = 0.92;
      delta_1                 = 0.5;
      delta_2                 = 0.9;
      delta_3                 = 0.9;
      delta_4                 = 0.7;        // qpm=0.99

      PIEDOUBLESTAR           = 3;
      PIE_HIGH                = 7;
      PIE_LOW                 = -1;

      kappa_high              = 0.3; 
      kappa_low               = -0.3; 

      DOLL                    = 0.4;

      lambda_1                = 0.12;       // new qpm ;
      lambda_2                = 0.7;        // new qpm
      lambda_3                = 0.05; //0.18;       // changed from 0.18 to 0.13 in new qpm
      lambda_4                = 0.15;       // changed from 0.07 to 0.109 in new qpm, 0.15 is in endoqpm_org
      lambda_5                = 0.12;

      theta_1                 = 0.8;        // qpm=1 
      theta_2                 = 0.8;        // qpm=0.95
      GROWTH_SS               = 5;          // qpm=5.5 
      UNR_BAR_SS              = 14;         // is in only endocred
      theta_3                 = 0.8;        // is in only endocred
      theta_4                 = 0.15;       // is in only endocred
      theta_5                 = 0.05;       // is in only endocred
      theta_6                 = 0.6;        // is in only endocred

      TERM6M_SS               = 0.05;
      TERM1Y_SS               = 0.10;       // qpm =0.8 
      TERM2Y_SS               = 0.20; 
      TERM3Y_SS               = 0.3;  
      TERM5Y_SS               = 0.50;
      TERM10Y_SS              = 1;
      RHO_TERM6M              = 0.90;
      RHO_TERM1Y              = 0.90;       // qpm=0.7
      RHO_TERM2Y              = 0.90;
      RHO_TERM3Y              = 0.90;
      RHO_TERM5Y              = 0.90;
      RHO_TERM10Y             = 0.90;

      RR_BAR_STAR_US          = 1.5;
      PREM_BAR_STAR           = 3.7; // ***4;          //4.5 RS_BAR_STAR - RS_BAR_STAR_US
      rho_EFFR_BAR            = 0.5;        //in qpm=0.95 and is RR_BAR's persistence

      rho_1                   = 0.85;
      rho_2                   = 0.7;
      rho_3                   = 0.86;
      rho_4                   = 0.95;       
      rho                     = 1;
      rho_5                   = 0.7;         //qpm=0.5, 0.7 
      rho_6                   = 0.9;         //qpm=0.85 
      rho_7                   = 0.2;        //0.1;
      rho_8                   = 0.9;         //endoqpm_org=0.9, qpm=0.7 
      rho_9                   = 0.45;        //qpm=0.7 
      rho_10                  = 1.2; //1; 

      PIE_STAR_US             = 2;      // ***2.4;        //2 previously, 2.4 new
      trade_AM_US             = 0.0525;
      dZ_US_t_SS              = EXCH_TREND_SS+(1-trade_AM_US)*dZ_PRT_SS;  //-0.2768
      sigma_min               = 0.3;        //0.5 in new qpm, 0.3 is in endoqpm_org;

    //  RS_US_SS                = RR_BAR_STAR_US + PIE_STAR_US;
    //  RR_BAR_STAR             = RR_BAR_STAR_US + PREM_BAR_STAR ;
    //  RS_SS                   = RR_BAR_STAR + PIEDOUBLESTAR;


      RS_US_SS                = RR_BAR_STAR_US + PIE_STAR_US;
      RS_SS                   = RS_US_SS+PREM_BAR_STAR+(dZ_US_t_SS+PIEDOUBLESTAR - PIE_STAR_US); 
      RR_BAR_STAR             = RS_SS - PIEDOUBLESTAR;   //5.4 from QPM

      EFF_RR_BAR_STAR         = (1-sigma_min)*(RS_SS) + (sigma_min)*(RS_US_SS +  (dZ_US_t_SS + PIEDOUBLESTAR-PIE_STAR_US + PREM_BAR_STAR)) - PIEDOUBLESTAR ;
      dS_PRT_SS               = dZ_PRT_SS - PIE_STAR_US + PIE_PRT_SS;
      PIE_F_SS                = trade_AM_US* PIE_STAR_US + (1-trade_AM_US)*(PIE_PRT_SS- dS_PRT_SS);
      dS_SS                   = PIEDOUBLESTAR - PIE_F_SS + EXCH_TREND_SS;


// The Model Equations 
model;

//_____________Inflation Block_______________________

[name = '1. Nontraded Sticky Phillips Curve']
PIE_NTSPI   =  n_alpha1*PIE4_NTSPI(-1)  + (1-n_alpha1)*PIE_NTSPI_EXP + n_alpha2 * RMC_NTSPI  + EPS_PIE_NTSPI + E_PIE_NTSPI;

[name = '2. Nontraded Sticky RMC']
RMC_NTSPI   =  
@#if nonlinearPC==0
           n_alpha3*(6*Y(-1)/(6-Y(-1))) + 
@#else
           n_alpha3*Y(-1) +
@#endif
           + (1-n_alpha3)*(RP_FLEX_g)  ; 

[name = '3. 4-Quarter MA Sticky Inflation rate']
//PIE4_NTSPI     =  0.25*(PIE_NTSPI+PIE_NTSPI(-1)+PIE_NTSPI(-2)+PIE_NTSPI(-3));
P_NTSPI = P_NTSPI (-4) + PIE4_NTSPI - PIEDOUBLESTAR;

[name = '4. AR(1) Process for Sticky Inflation Shock']
EPS_PIE_NTSPI = gamma_1*EPS_PIE_NTSPI(-1) + E_EPS_PIE_NTSPI;

[name = '5. Regulated Services Phillips Curve']
PIE_REG = r_alpha1* PIE_STAR + r_alpha2* RMC_REG + E_PIE_REG;

[name = '6. Real Marginal Cost of Regulated Services']
RMC_REG = -RP_REG_g(-1);

[name = '7. Flexible Inflation Phillips Curve']
PIE_FLEX = f_alpha1 * PIE_FLEX(-1) + (1-f_alpha1-f_alpha3-f_alpha4-f_alpha5)*(PIE_NTSPI_EXP + (PIEDOUBLESTAR-1)*PIE_STAR)/PIEDOUBLESTAR + f_alpha2*RMC_FLEX + f_alpha3* PIE_imp + f_alpha4*PIE_food_imp + f_alpha5* PIE_oil_imp +  E_PIE_FLEX;

[name = '14. 4-Quarter MA Flexible inflation']
//PIE4_FLEX = 0.25*(PIE_FLEX + PIE_FLEX(-1) + PIE_FLEX(-2) + PIE_FLEX(-3));
P_FLEX = P_FLEX(-4) + PIE4_FLEX - PIEDOUBLESTAR; 

[name = '8.Imported Food Price']
P_food_imp = PFfood + S - qfood_t - Z_US_t;

[name = '9.Imported Food Inflation']
PIE_food_imp = (P_food_imp - P_food_imp(-1))*4 +PIEDOUBLESTAR ;

[name = '10.Imported Oil Price']
P_oil_imp = PFoil+S-qoil_t-Z_US_t;

[name = '11.Imported Oil Inflation']
PIE_oil_imp = (P_oil_imp - P_oil_imp(-1))*4 + PIEDOUBLESTAR;

[nema = '12. Real Marginal Cost of Flexible prices']
RMC_FLEX = - f_alpha6 * RP_FLEX_g(-1) + 
@#if nonlinearPC==0
           f_alpha7*(6*Y/(6-Y)) + 
@#else
           f_alpha7*Y + 
@#endif
           + f_alpha8* Z_US_g(-1) + f_alpha9*(dZ-EXCH_TREND_SS)  +   f_alpha10*qoil_g + f_alpha11* qfood_g; //  (dS-(dZ-(PIE_F_SS - PIE_STAR)))

[name = '13. QoQ Headline Inflation']
PIE_HEADLINE = w_ntspi*PIE_NTSPI + w_reg*PIE_REG + (1 - w_ntspi - w_reg)* PIE_FLEX ;

[name = '14. 4-Quarter MA Headline inflation']
//PIE4_HEADLINE = 0.25*(PIE_HEADLINE + PIE_HEADLINE(-1) + PIE_HEADLINE(-2) + PIE_HEADLINE(-3));
P = P(-4) + PIE4_HEADLINE - PIEDOUBLESTAR;

P = P(-1) + PIE_HEADLINE/4 - PIEDOUBLESTAR/4;

[name = '15. Sticky Price Level']
P_NTSPI = P_NTSPI(-1) + PIE_NTSPI/4 - PIEDOUBLESTAR/4  ;

[name = '16. Flexible Price level']
P_FLEX = P_FLEX(-1) + PIE_FLEX/4 - PIEDOUBLESTAR/4;

[name = '17. Regulative Services Price level']
P_REG = P_REG(-1) + PIE_REG/4 - PIEDOUBLESTAR/4;

P_REG = P_REG(-4) + PIE4_REG- PIEDOUBLESTAR;

[name = '18.Headline CPI']
P_HEADLINE = P_HEADLINE(-1) + PIE_HEADLINE/4 - PIEDOUBLESTAR/4;

[name = '19. Relative Price of Regulative Services']
RP_REG      = P_REG - P_NTSPI;

[name = '20. Relative Flexible Price']
RP_FLEX     = P_FLEX - P_NTSPI;

[name = '22. Regulative services relative price gap']
RP_REG    = RP_REG_t + RP_REG_g;

[name = '23. Regulative services relative price trend']
RP_REG_t  = 0.75*RP_REG_t(-1) + (1-0.75)*gRP_REG_t  + E_RPREG_t;        // 0.85*RP_REG_t(-1) in old QPM

[name = '24. Persistence in the trend of regulative services relative price']
gRP_REG_t = 0.5* gRP_REG_t(-1) + (1-0.5)*dRP_REG_SS + E_gRPREGt;

[name = '25. Flexible relative price gap']
RP_FLEX   = RP_FLEX_t + RP_FLEX_g;

[name = '26. Flexible relative price trend']
RP_FLEX_t = 0.75*RP_FLEX_t(-1) + (1-0.75)*gRP_FLEX_t  + E_RPFLEX_t;     //1*RP_FLEX_t(-1) in QPM

[name = '27. Persistence in the trend of flexible relative price']
gRP_FLEX_t = 0.5* gRP_FLEX_t(-1) + (1-0.5)*dRP_FLEX_SS + E_gRPFLEXt;    // 0.85*gRP_FLEX_t(-1) in QPM


[name = '31. Real price of oil']
qoil = PFoil-P_US;

[name = '32. trend and gap']
qoil = qoil_t+qoil_g;

[name = '33. Change in Oil Price Trend']
d_qoil_t = (qoil_t-qoil_t(-1))*4 + d_qoil_ss;

[name = '34. Change in Oil Price Trend']
d_qoil_t = alpha1_oil*d_qoil_t(-1)+ (1-alpha1_oil)*d_qoil_ss+E_d_qoil_t;

[name = '35. Oil Price Gap']
qoil_g=alpha2_oil*qoil_g(-1)+E_qoil_g;
    
[name = '36. Real food Price']
qfood = PFfood-P_US;   

[name = '37. Food trend and gap']
qfood = qfood_t+qfood_g;

[name = '38. Change in Real food Price Trend']
d_qfood_t = (qfood_t-qfood_t(-1))*4+d_qfood_ss;

[name = '39. Change in Real food Price Trend']
d_qfood_t = alpha1_food*d_qfood_t(-1)+ (1-alpha1_food)*d_qfood_ss+E_d_qfood_t;

[name = '40. Food Price Gap']
qfood_g=alpha2_food*qfood_g(-1)+E_qfood_g; 

//______________ Credibility and Expectations _________________

[name = '41. Residual Under Optimistic Expectations With Inflation Convergence to Target']
PIE_DEV_TAR = PIE4_NTSPI - (delta_1* PIE4_NTSPI(-1) + (1-delta_1)* PIEDOUBLESTAR);

[name = '42. Residual Under Skeptical Expectations of a High Inflation Regime']
PIE_DEV_HIGH = PIE4_NTSPI - (delta_2* PIE4_NTSPI(-1) + (1-delta_2)* PIE_HIGH);

[name = '43. Residual Under Skeptical Expectations of a Low Inflation Trap']
PIE_DEV_LOW = PIE4_NTSPI - (delta_3* PIE4_NTSPI(-1) + (1-delta_3)* PIE_LOW);

[name = '44. Probability of Entering High Inflation Regime']
P_HIGH = (PIE_DEV_TAR > 0) * (PIE_DEV_TAR^2 / (PIE_DEV_TAR^2 + PIE_DEV_HIGH^2)) + (PIE_DEV_TAR <= 0) * 0;

[name = '45. Probability of Entering High Inflation Regime']
P_LOW = (PIE_DEV_LOW < 0) * (PIE_DEV_TAR^2 / (PIE_DEV_TAR^2 + PIE_DEV_LOW^2)) + (PIE_DEV_TAR >= 0) * 0;

[name = '46. Flow of Credibility']
C_FLOW =  1- P_LOW - P_HIGH; 

[name = '47. Formation of Credibility']
C = delta*C(-1) + (1-delta)*C_FLOW + EPS_C + E_C;
//C=1;

[name = '48. AR(1) Process for Credibility Shock']
EPS_C = gamma_2*EPS_C(-1) + E_EPS_C;

[name = '49. Formation of Expectations']
PIE_NTSPI_EXP = C*PIE4_NTSPI(+4) + (1 - C)*PIE4_NTSPI(-1) + kappa_low*P_LOW + kappa_high*P_HIGH + EPS_PIE_NTSPI_EXP + E_PIE_NTSPI_EXP; 
//PIE_NTSPI_EXP = 0.6*PIE4_NTSPI(+4) + (1 - 0.6)*PIE4_NTSPI(-1) + kappa_low*P_LOW + kappa_high*P_HIGH + EPS_PIE_NTSPI_EXP + E_PIE_NTSPI_EXP; 

[name = '50. AR(1) Process for Expectations Shock']
EPS_PIE_NTSPI_EXP = gamma_3*EPS_PIE_NTSPI_EXP(-1) + E_EPS_PIE_NTSPI_EXP;

[name = '51. Time Varying Inflation Target']
PIE_STAR = delta_4*PIE_STAR(-1) + (1 - delta_4)*PIEDOUBLESTAR + E_PIESTAR;


//________________Output and Unemployment______________________

[name = '52. Output Gap']
Y = lambda_1*Y(+1) + lambda_2*Y(-1) 
@#if longtermprem==0
       - lambda_3*EFF_LR_GAP
@#else
         - lambda_3*EFF_RR_g
@#endif
       + lambda_4*Z_g
       + lambda_5*Y_WORLD + EPS_Y + E_Y;

[name = '53. AR(1) Process for Output Gap Persistence']
EPS_Y = gamma_4*EPS_Y(-1) + E_EPS_Y;

[name = '54. Cumulative Output Gap']
CUMSUMY = CUMSUMY(-1) + Y/4;

[name = '55. Real GDP, Y-o-Y Log Growth Equation']
DL_GDP = DL_GDP_BAR + (Y - Y(-4));

[name = '56. Potential GDP, Q-o-Q Annualized Log Growth']
DL_GDP_BAR = theta_1*DL_GDP_BAR(-1) + (1-theta_1)*G_GDP_BAR + E_DL_GDP_BAR;

[name = '57. Persistent Component in Potential GDP Growth']
G_GDP_BAR = theta_2*G_GDP_BAR(-1) + (1-theta_2)*GROWTH_SS + E_G_GDP_BAR;

[name = '58. Unemployment Gap']
UNR_GAP = theta_3*UNR_GAP(-1) - theta_4*Y  - theta_5*Y(+1) + E_UNR_GAP;

[name = '59. NAIRU']
UNR_BAR = UNR_BAR_SS + G_UNR + EPS_UNR_BAR + E_UNR_BAR;

[name = '60. Persistent Component in US NAIRU']
G_UNR = theta_6*G_UNR(-1) + E_UNR_G;

[name = '61. Serially Correlated NAIRU Shock']
EPS_UNR_BAR = gamma_5*EPS_UNR_BAR(-1) + E_EPS_UNR_BAR;

[name = '62. Unemployment Rate']
UNR = UNR_BAR + UNR_GAP; 

//______________Interest Rate Block___________________

[name = '63. Effective Nominal Interest Rate']
EFF_RS =  (1-sigma)*(RS) + (sigma)*(RS_US +  (dZ_US_t + PIE_STAR-PIE_STAR_US + PREM));

[name = '64. Effective Real Interest Rate']
EFF_RS  =   (EFF_RR  ) + (PIE_NTSPI_EXP );

[name = '65. Effective Real Interest Rate Gap']
EFF_RR_g = EFF_RR - EFF_RR_BAR;

[name = '66. Effective Real Interest Rate Trend']
EFF_RR_BAR = rho_EFFR_BAR* EFF_RR_BAR(-1) + (1-rho_EFFR_BAR)*EFF_RR_BAR_STAR + E_EFF_RR_BAR;

[name = '67. Dollarization Parameter']
sigma = sigma_min + (1-sigma_min-DOLL)*(1-C);

[name = '74. US 6-Month Term Premium Equation']
TERM6M = RHO_TERM6M*TERM6M(-1) + (1-RHO_TERM6M)*TERM6M_SS  + 0.3*E_TERM + E_TERM6M;

[name = '75. 1-Year Term Premium Equation']
TERM1Y = RHO_TERM1Y*TERM1Y(-1) + (1-RHO_TERM1Y)*TERM1Y_SS  + 0.4*E_TERM + E_TERM1Y;

[name = '76. 2-Year Term Premium Equation']
TERM2Y = RHO_TERM2Y*TERM2Y(-1) + (1-RHO_TERM2Y)*TERM2Y_SS  + 0.7*E_TERM + E_TERM2Y;

[name = '77. 3-Year Term Premium Equation']
TERM3Y = RHO_TERM3Y*TERM3Y(-1) + (1-RHO_TERM3Y)*TERM3Y_SS  + E_TERM + E_TERM3Y;

[name = '78. 5-Year Term Premium Equation']
TERM5Y = RHO_TERM5Y*TERM5Y(-1) + (1-RHO_TERM5Y)*TERM5Y_SS  + 1.1*E_TERM + E_TERM5Y ;

[name = '79. 10-Year Term Premium Equation']
TERM10Y = RHO_TERM10Y*TERM10Y(-1) + (1-RHO_TERM10Y)*TERM10Y_SS + 1.4*E_TERM + E_TERM10Y;

[name = '86. Real Interest Rate']
RR = RS-PIE_NTSPI_EXP;

[name = '92. Real Interest Rate Trend']
RR_BAR = 0.95*RR_BAR(-1) + (1-0.95)*RR_BAR_STAR + E_RR_BAR;

[name = '98. Real Interest Rate Gap']
RR_GAP = RR - RR_BAR;


//________________Loss Function and Taylor Rule______________________

[name = '100. AR(1) Process for MP Shock']
EPS_RS = gamma_6*EPS_RS(-1) + E_EPS_RS;

[name = '101. Loss Function']
LOSS = PIE_GAP^2 + 1.0*Y^2 + 0.5*DRS^2 + 0.1*P_GAP^2;

[name = '102. Change in Policy Rate']
DRS = RS - RS(-1);
 
[name = '103. YoY inflation deviation from its target']
PIE_GAP = PIE4_HEADLINE - PIE_STAR;

[name = '104. Negative Output Gap']
YNEG = (Y-ABS(Y))/2;

[name = '105. Price Level Gap']
P_GAP = P_GAP(-1) + (PIE_HEADLINE-PIEDOUBLESTAR)/4;

[name = '106. Negative Price Level Gap']
PGAPNEG = (P_GAP-ABS(P_GAP))/2;

[name = '107. Changes in Credibility']
DC = C - C(-1);

[name = '108. Negative Changes in Credibility']
DCNEG = (DC-ABS(DC))/2;


//____________________UIP and Exchange Rates_______________________
[name = '109.Change in the real exchange rate trend / partners vs US']
dZ_PRT_t = rho_1* dZ_PRT_t(-1) + (1- rho_1)* dZ_PRT_SS + E_dZ_PRT_t;

[name = '110.Real Exchange Rate Trend / partners vs US']
Z_PRT_t = Z_PRT_t(-1) + dZ_PRT_t/4 -dZ_PRT_SS/4  ; 

[name = '111.Real Exchange Rate Gap / partners vs US']
Z_PRT_g = rho_2* Z_PRT_g(-1) + E_Z_PRT_g;

[name = '112.Real Exchange Rate Level / partners vs US']
Z_PRT_g = Z_PRT - Z_PRT_t;

[name = '113.Change in real exchange rate / partners vs US']
Z_PRT = Z_PRT(-1) + dZ_PRT/4 -dZ_PRT_SS/4;
 
[name = '114.Partners excluding US inflation in respective currencies']
PIE_PRT = rho_3 * PIE_PRT(-1) + (1-rho_3)* PIE_PRT_SS + E_PIE_PRT;

[name = '115.Partners excluding USA CPI in respective currencies']
P_PRT = P_PRT(-1) + PIE_PRT/4 - PIE_PRT_SS/4;

[name = '116.Nominal exchange rate / Partners vs US (increase is appreciation of USD)']
Z_PRT = S_PRT + P_US - P_PRT;

[name = '117.Nominal exchange rate change / Partners vs US']
S_PRT = S_PRT(-1) + (dS_PRT-dS_PRT_SS)/4;

[name = '118.Foreign Inflation in dollars'] 
PIE_F = trade_AM_US* PIE_US + (1-trade_AM_US)*(PIE_PRT - dS_PRT); 

[name = '119.Foreign price level in dollars'] 
P_F = P_F(-1) + (PIE_F-PIE_F_SS)/4 ;

[name = '120.Change in real /effective/ exchange rate trend']
dZ_t = rho_4*dZ_t(-1) + (1-rho_4)*EXCH_TREND_SS + E_dZ_t;   

[name = '121.Real effective exchange rate trend']
Z_t = Z_t(-1) + dZ_t/4 -EXCH_TREND_SS/4 + E_Z_t;

[name = '122.Change in the nominal billateral exchange rate/ dollar vs dram']
S = S(-1) + (dS-dS_SS)/4 ;

[name = '123.Imported Inflation']
PIE_imp = (PIE_F) + (dS )- (dZ_t );  

[name = '124.Real effective exchange rate level']
Z = S + P_F - P_HEADLINE ;

[name = '125.Change in Real effective exchange rate'] 
Z = Z(-1)  + (dZ-EXCH_TREND_SS)/4  ;

[name = '126.Real effective exchange rate gap'] 
Z_g  = Z - Z_t;

[name = '127.Real exchange rate trend vs US']
Z_US_t = Z_t + (1 - trade_AM_US)*Z_PRT_t;

[name  = '128.Change in real exchange rate trend vs US']
Z_US_t = Z_US_t(-1) + (dZ_US_t -dZ_US_t_SS )/4 ;

[name = '129.Real exchange rate level vs US']
Z_US = Z + (1 - trade_AM_US)* Z_PRT;

[name = '130.Change in real exchange rate level vs US']
Z_US = Z_US(-1) + (dZ_US-dZ_US_t_SS)/4;

[name = '131.Real exchange rate gap vs US']
Z_US_g = Z_US - Z_US_t;

[name = '132.UIP']
rho* RS + (1-rho)* (RR_BAR + PIE_STAR) = rho* RS_US + (1-rho)*(RR_BAR_US + PIE_STAR_US) + 4*(S_exp - S) + PREM + FX_PREM + E_S + (dZ_US_t_SS + PIEDOUBLESTAR - PIE_STAR_US) ;  

[name = '133. Expected Exchange Rate']
S_exp = rho_5 * S(+1) + (1-rho_5)* (S(-1)+2*((dZ_US_t)+(PIE_STAR)-(PIE_STAR_US))/4 - 2/4*(dZ_US_t_SS+PIEDOUBLESTAR-PIE_STAR_US));

[name = '134..  Risk premium']
PREM  = rho_6*PREM(-1) + (1-rho_6)*PREM_BAR + rho_7*P_HIGH + E_PREM;

[name = '135.  Risk premium Trend']
PREM_BAR = rho_8* PREM_BAR(-1) +(1-rho_8)*PREM_BAR_STAR +  E_PREM_BAR;

[name = '136. Liquidity risk premium']
FX_PREM  = rho_9*FX_PREM(-1) +  rho_10*(sigma  - sigma(-1)) + E_FX_PREM;

//___________________External Sector___________________

[name = '138. US real interest rate']
RR_US = 0.85*RR_US(-1) + (1-0.85)*RR_BAR_US + E_RR_US; 

[name = '139. US Real Interest Rate Trend']
RR_BAR_US = 0*RR_BAR_US(-1) + 1.0*RR_BAR_STAR_US + E_RR_BAR_US; 

[name = '140.US Interest Rate']
RS_US = 0.85*RS_US(-1) + (1-0.85)*(RR_BAR_US + PIE_STAR_US) + E_RS_US;

[name = '141. World Output Gap']
Y_WORLD = 0*Y_WORLD(-1) + E_Y_WORLD;

[name = '142. US Inflation']
PIE_US = 0.23* PIE_US(-1) + (1-0.23)*PIE_STAR_US + E_PIE_US;

[name = '143. US Price Level']
P_US = P_US(-4)+ PIE_US - PIE_STAR_US;

// ______Long-run effective interest rate_________________

[name = '144. 6-Month Expected Effective Real Interest Rate']
EFF_RR6m = 1/2 * (
@#for i in 0:1
+EFF_RR(@{i})
@#endfor
);

[name = '145. 1-Year Expected Effective Real Interest Rate']
EFF_RR4 = (1/4) * (
@#for i in 0:3
+EFF_RR(@{i})
@#endfor
);

[name = '146. 3-Year Expected Effective Real Interest Rate']
EFF_RR12 = (1/12) * (
@#for i in 0:11
+EFF_RR(@{i})
@#endfor
);

[name = '147. 5-Year Expected Effective Real Interest Rate']
EFF_RR20 = (1/20) * (
@#for i in 0:19
+EFF_RR(@{i})
@#endfor
);

[name = '148. 10-Year Expected Effective Real Interest Rate']
EFF_RR40 = (1/40) * (
@#for i in 0:39
+EFF_RR(@{i})
@#endfor
);

[name = '149. Long Run Real Effective Interest Rate'] 
EFF_LR = 0.1* EFF_RR + 0.2*( EFF_RR6m + TERM6M - TERM6M_SS) +   0.25*(EFF_RR4 + TERM1Y-TERM1Y_SS) + 0.25*(EFF_RR12 + TERM3Y - TERM3Y_SS ) + 0.2*(EFF_RR20 + TERM5Y - TERM5Y_SS) ;

[name = '144. 6-Month Expected Effective Real Interest Rate Trend']
EFF_RR_BAR6m = 1/2 * (
@#for i in 0:1
+EFF_RR_BAR(@{i})
@#endfor
);

[name = '150. 1-Year Expected Real Effective Interest Rate Trend']
EFF_RR_BAR4 = (1/4) * (
@#for i in 0:3
+EFF_RR_BAR(@{i})
@#endfor
);

[name = '151. 3-Year Expected Real Effective Interest Rate Trend']
EFF_RR_BAR12 = (1/12) * (
@#for i in 0:11
+EFF_RR_BAR(@{i})
@#endfor
);

[name = '152. 5-Year Expected Real Effective Interest Rate Trend']
EFF_RR_BAR20 = (1/20) * (
@#for i in 0:19
+EFF_RR_BAR(@{i})
@#endfor
);

[name = '153. 10-Year Expected Real Effective Interest Rate Trend']
EFF_RR_BAR40 = (1/40) * (
@#for i in 0:39
+EFF_RR_BAR(@{i})
@#endfor
);

[name = '154. Long Run Real Effective Interest Rate Trend']
EFF_LR_BAR = 0.1*EFF_RR_BAR +0.25* EFF_RR_BAR6m + 0.25*(EFF_RR_BAR4) + 0.2 * (EFF_RR_BAR12) + 0.2 * (EFF_RR_BAR20);

[name = '99.Long Run Real Effective Interest Rate Gap']
EFF_LR_GAP = EFF_LR - EFF_LR_BAR;

//[name = 'Monetary Policy Rule']
//RS = 0.5*RS(-1) + (1-0.5)* (RR_BAR + PIE_NTSPI_EXP + 1.5*(PIE_HEADLINE- PIE_STAR) + 0.1*Y)+E_RS ;  //______2*(PIE_HEADLINE- PIE_STAR)

end;


steady_state_model;   
    EPS_PIE_NTSPI       =   0;
    RMC_NTSPI           =   0;
    PIE_STAR            =   PIEDOUBLESTAR;                  
    PIE_NTSPI_EXP       =   PIE_STAR;
    PIE_NTSPI           =   PIE_NTSPI_EXP;  
    PIE4_NTSPI          =   PIE_NTSPI;

    gRP_REG_t           =   dRP_REG_SS;
    RP_REG_t            =   gRP_REG_t;
    RP_REG_g            =   0;
    RP_REG              =   RP_REG_t;
    gRP_FLEX_t          =   dRP_FLEX_SS;
    RP_FLEX_t           =   gRP_FLEX_t;
    RP_FLEX_g           =   0;
    RP_FLEX             =   RP_FLEX_t;

    RMC_REG             =   -RP_REG_g;
    PIE_REG             =   r_alpha1*PIE_STAR; 
    PIE4_REG            =   PIE_REG;
    RMC_FLEX            =   0;
    PIE_food_imp        =   PIEDOUBLESTAR;  
    PIE_oil_imp         =   PIEDOUBLESTAR;  
    PIE_imp             =   PIEDOUBLESTAR;  
    PIE_FLEX            =   PIEDOUBLESTAR;  
    PIE_HEADLINE        =   w_ntspi*PIE_NTSPI + w_reg*PIE_REG + (1 - w_ntspi - w_reg)* PIE_FLEX ;
    PIE4_HEADLINE       =   PIE_HEADLINE;
    PIE4_FLEX           =   PIE_FLEX;

    qoil_g              =   0;
    d_qoil_t            =   d_qoil_ss;
//    qoil_t              =   0;
    qoil                =   qoil_t;
    qfood_g             =   0;
    d_qfood_t           =   d_qfood_ss;
//    qfood_t             =   0;
    qfood               =   qfood_t;
    
    PIE_DEV_TAR         =   PIE4_NTSPI - (delta_1*PIE4_NTSPI + (1-delta_1)*PIEDOUBLESTAR);
    PIE_DEV_HIGH        =   PIE4_NTSPI - (delta_2*PIE4_NTSPI + (1-delta_2)*PIE_HIGH);
    PIE_DEV_LOW         =   PIE4_NTSPI - (delta_3*PIE4_NTSPI + (1-delta_3)*PIE_LOW);
    P_HIGH              =   0;
    P_LOW               =   0;
    C_FLOW              =   1-P_HIGH-P_LOW;
    C                   =   C_FLOW;
    sigma               =   sigma_min;
    EPS_C               =   0;

    Y                   =   0;
    EPS_Y               =   0;
    CUMSUMY             =   0;
    G_GDP_BAR           =   GROWTH_SS;
    DL_GDP_BAR          =   G_GDP_BAR;
    DL_GDP              =   DL_GDP_BAR;
    UNR_GAP             =   0;
    G_UNR               =   0;
    EPS_UNR_BAR         =   0;
    UNR_BAR             =   UNR_BAR_SS;
    UNR                 =   UNR_BAR;

    RR_BAR              =   RR_BAR_STAR;
    RR_GAP              =   0;
    RR                  =   RR_BAR;

    EFF_RR_g            =   0; 
    EFF_RR_BAR          =   EFF_RR_BAR_STAR;
    EFF_RR_BAR6m        =   EFF_RR_BAR;
    EFF_RR_BAR4         =   EFF_RR_BAR;   
    EFF_RR_BAR12        =   EFF_RR_BAR;    
    EFF_RR_BAR20        =   EFF_RR_BAR;    
    EFF_RR_BAR40        =   EFF_RR_BAR;  

    EFF_RR              =   EFF_RR_BAR;
    EFF_RR6m            =   EFF_RR;
    EFF_RR4             =   EFF_RR;
    EFF_RR12            =   EFF_RR;
    EFF_RR20            =   EFF_RR;
    EFF_RR40            =   EFF_RR;

    EFF_LR_BAR          =   EFF_RR_BAR;
    EFF_LR_GAP          =   0;
    EFF_LR              =   EFF_LR_BAR;

    EFF_RS              =   EFF_RR + PIE_NTSPI_EXP;

    TERM6M              =   TERM6M_SS;
    TERM1Y              =   TERM1Y_SS;
    TERM2Y              =   TERM2Y_SS;
    TERM3Y              =   TERM3Y_SS;
    TERM5Y              =   TERM5Y_SS;
    TERM10Y             =   TERM10Y_SS;

    EPS_RS              =   0;
    LOSS                =   0;
    DRS                 =   0;
    PIE_GAP             =   0;
    YNEG                =   0;
    P_GAP               =   0;
    PGAPNEG             =   0;
    DC                  =   0;
    DCNEG               =   0;

    dZ_PRT_t            =   dZ_PRT_SS;
    Z_PRT_g             =   0;
    dZ_PRT              =   dZ_PRT_t;
    PIE_PRT             =   PIE_PRT_SS;
    PIE_US              =   PIE_STAR_US;
    dS_PRT              =   dZ_PRT-PIE_US+PIE_PRT;
    PIE_F               =   trade_AM_US*PIE_US+(1-trade_AM_US)*(PIE_PRT - dS_PRT);
    dZ_t                =   EXCH_TREND_SS;
    dZ_US_t             =   dZ_t + (1-trade_AM_US)*dZ_PRT_t;
    Z_g                 =   0;
    dZ                  =   dZ_t;
    Z_US_g              =   0;
    dZ_US               =   dZ_US_t;
    dS                  =   PIE_imp - PIE_F  + dZ_t; 

    PREM_BAR            =   PREM_BAR_STAR;
    PREM                =   PREM_BAR;
    FX_PREM             =   0;
    RR_BAR_US           =   RR_BAR_STAR_US;
    RR_US               =   RR_BAR_US;
    RS_US               =   RS_US_SS;  
  RS = RS_SS; 

end;

//planner_objective 0.5*PIE_GAP^2 + 0.1*Y^2 + 2*DRS^2 ; 
planner_objective 0.34*PIE_GAP^2 + 0.15*Y^2 + 0.9*DRS^2 ; 

ramsey_model(planner_discount = 0.95, instruments=(RS));

//initval;
 // RS = RS_SS; 
//end;

steady;

// 0 = 2026Q1
histval;

PIE_FLEX(0) =  6.8; //             3; //1.13; //3;
//PIE_FLEX(-1) = 1.7;
//PIE_FLEX(-2) = 3.7;
//PIE_FLEX(-3) =8.1;

PIE4_FLEX(0) =  5.1; //            3; //3.95; //3;
//PIE4_FLEX(-1) = 3.8;
//PIE4_FLEX(-2) = 4;
//PIE4_FLEX(-3) = 4.48;

PIE_NTSPI(0) =  5.7; //            3; //1.59; //3;
//PIE_NTSPI(-1) = 2.6;
//PIE_NTSPI(-2) = 1.6;
//PIE_NTSPI(-3) = 1.46;

PIE4_NTSPI(0) =  2.87; 
//PIE4_NTSPI(-1) =  2.06; 
//PIE4_NTSPI(-2) =  2.1; 
//PIE4_NTSPI(-3) =  2.28; 

PIE_HEADLINE(0) =  6.2; //          3; // 5.65;
//PIE_HEADLINE(-1) = 1.7;
//PIE_HEADLINE(-2) = 3.2;
//PIE_HEADLINE(-3) = 5.4;

PIE4_HEADLINE(0) =  4.2;
//PIE4_HEADLINE(-1) =  3.27;
//PIE4_HEADLINE(-2) =  3.5;
//PIE4_HEADLINE(-3) =  3.78;

PIE_REG(0) = 3.6;
//PIE_REG(-1) = 0.09;
//PIE_REG(-2) = 2.3;
//PIE_REG(-3) = -3.4;

PIE4_REG(0) = 0.6;
//PIE4_REG(-1) = 1.89;
//PIE4_REG(-2) = 2.25;
//PIE4_REG(-3) = 1.94;



PIE_imp(0) = 3;
PIE_food_imp(0) = 3;
PIE_oil_imp(0) = 3;
PIE_NTSPI_EXP(0) = 3;
RP_REG_t(0) = dRP_REG_SS;
gRP_REG_t(0) = dRP_REG_SS;
RP_REG_g(0) = 0;
RP_FLEX_t(0) = dRP_FLEX_SS;
gRP_FLEX_t(0) = dRP_FLEX_SS;
RP_FLEX_g(0) = 0;
d_qoil_t(0)= d_qoil_ss;
qoil_g(0) = 0;
d_qfood_t(0) =d_qfood_ss; 
qfood_g (0) =   0;   
EPS_PIE_NTSPI(0) = 0;
C(0) =                      1; //0.85; //1;
EPS_PIE_NTSPI_EXP(0) = 0;
EPS_C(0) = 0;
PIE_STAR(0) = 3;
Y(0) =                   0.5; //0.4; //0;
Y(-1) = 0;
Y(-2) = 0;
EPS_Y(0) = 0;
DL_GDP_BAR(0) = GROWTH_SS;
G_GDP_BAR(0) = GROWTH_SS;
UNR_GAP(0) = 0;
G_UNR(0) = 0;
EPS_UNR_BAR(0) = 0;
RS(0)=6.71; //RS_SS;
TERM6M(0) = TERM6M_SS;
TERM1Y(0) = TERM1Y_SS;
TERM2Y(0) = TERM2Y_SS;
TERM3Y(0) = TERM3Y_SS;
TERM5Y(0) = TERM5Y_SS;
TERM10Y(0) = TERM10Y_SS;
RR_BAR(0) = RR_BAR_STAR;
EFF_RR_BAR(0) = EFF_RR_BAR_STAR;
sigma(0) = sigma_min;
EPS_RS(0) = 0;
P_GAP(0) = 0;
PREM(0) =                      PREM_BAR_STAR; //  3; //PREM_BAR_STAR;
RR_US(0) = RR_BAR_US;
RS_US(0) =                     RS_US_SS; // 6.71; //RS_US_SS;
PREM_BAR(0) = PREM_BAR_STAR;
FX_PREM(0) =                    0; //-2; //0;
PIE_US(0) = PIE_STAR_US;
dZ_t(0) =                       EXCH_TREND_SS; //-1.8; //EXCH_TREND_SS;
Z_US_g(0)= 0;
Z_g(0) =                       0; // 6.24; //0;
dZ_US(0)= dZ_US_t;
Z_PRT_g(0) = 0;
dZ_PRT_t(0)=   dZ_PRT_SS;
dZ(0) =                         EXCH_TREND_SS; //-1.42; //EXCH_TREND_SS;
EFF_LR_BAR(0) = EFF_RR_BAR_STAR;
EFF_LR(0) =EFF_RR_BAR_STAR;

end;

shocks; 
var E_Y;
periods 0 1 2;
values 0.6 0.9 0.8;

var E_PIE_FLEX;
periods 0 1 2 3 ;
values 4.5 3.4 2.3 -0.7; 

//var E_PIE_FLEX;
//periods 1, 2, 3  ;
//values 0.7 0.6 0.2; 
//values 4.01 0.01 0; 


//var E_FX_PREM;
//periods 1, 2, 3 ,4,5 ;
//values -1.5, -1.4, -1.3, -1.2, -1.1; 


end; 

model_info;

ramsey_constraints;
  RS > 0.1;
end;

perfect_foresight_setup(periods=150);

perfect_foresight_solver(lmmcp, no_homotopy);

dark_blue = "#00163B";
gold      = "#D39C1F";

figure(1)
subplot(3,4,1)
plot(PIE_HEADLINE(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
hold on
plot(PIE4_HEADLINE(1:52), 'Color', gold, 'LineWidth', 1.5, 'LineStyle', '--')
yline(3.0, '--', 'Target = 3%', 'Color', [0.67 0.73 0.8]);
legend('QoQ Ann.', 'YoY', 'Location', 'best')
title('CPI Inflation')

subplot(3,4,2)
plot(PIE_NTSPI(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
hold on
plot(PIE4_NTSPI(1:52), 'Color', gold, 'LineWidth', 1.5, 'LineStyle', '--')
yline(3.0, '--', 'Target = 3%', 'Color', [0.67 0.73 0.8]);
legend('QoQ Ann.', 'YoY', 'Location', 'best')
title('NTSPI Inflation')

subplot(3,4,3)
plot(PIE_FLEX(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
hold on
plot(PIE4_FLEX(1:52), 'Color', gold, 'LineWidth', 1.5, 'LineStyle', '--')
yline(3.0, '--', 'Target = 3%', 'Color', [0.67 0.73 0.8]);
legend('QoQ Ann.', 'YoY', 'Location', 'best')
title('Flexible Inflation')

subplot(3,4,4)
plot(PIE_REG(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
hold on
plot(PIE4_REG(1:52), 'Color', gold, 'LineWidth', 1.5, 'LineStyle', '--')
yline(3.0, '--', 'Target = 3%', 'Color', [0.67 0.73 0.8]);
legend('QoQ Ann.', 'YoY', 'Location', 'best')
title('Regulated Services Inflation')

subplot(3,4,5)
plot(Z_g(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
title('Real Exchange Rate Gap')

subplot(3,4,6)
plot(dZ(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
title('RER Depreciation')

subplot(3,4,7)
plot(PREM(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
hold on
plot(FX_PREM(1:52), 'Color', gold, 'LineWidth', 1.5, 'LineStyle', '--')
legend('Country risk premium', 'FX premium', 'Location', 'best')
title('Risk Premia')

subplot(3,4,8)
plot(C(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
title('Credibility Index')

subplot(3,4,9)
plot(RS(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
title('Nominal Policy Rate')

subplot(3,4,10)
plot(EFF_LR_BAR(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
title('LR Real Effective Rate Trend')

subplot(3,4,11)
plot(Y(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
title('Output Gap')

subplot(3,4,12)
plot(sigma(1:52), 'Color', dark_blue, 'LineWidth', 1.5)
yline(0.3, '--', 'Optimal level', 'Color', [0.67 0.73 0.8]);
title('Dollarization')


figure(2)
sgtitle('Flexible RMC components')
subplot(2,3,1)
plot(RP_FLEX(1:52), 'b', 'LineWidth', 1.5)
title('relative flexible price')

subplot(2,3,2)
plot(Y(1:52), 'b', 'LineWidth', 1.5)
title('Output Gap')

subplot(2,3,3)
plot(Z_US_g(1:52), 'b', 'LineWidth', 1.5)
title('Exchange rate gap vs USD')

subplot(2,3,4)
plot(dZ(1:52), 'b', 'LineWidth', 1.5)
title('REER depreciation')

subplot(2,3,5)
plot(qoil_g(1:52), 'b', 'LineWidth', 1.5)
title('Real oil price gap')

subplot(2,3,6)
plot(qfood_g(1:52), 'b', 'LineWidth', 1.5)
title('Real food price gap')


figure(3)
sgtitle('Flexible inflation components')
subplot(2,3,1)
plot(RMC_FLEX(1:52), 'b', 'LineWidth', 1.5)
title('Flexible Real Marginal Cost')

subplot(2,3,2)
plot(PIE_NTSPI_EXP(1:52), 'b', 'LineWidth', 1.5)
title('Inflation expectations')

subplot(2,3,3)
plot(Z_US_g(1:52), 'b', 'LineWidth', 1.5)
title('Exchange rate gap vs USD')

subplot(2,3,4)
plot(PIE_imp(1:52), 'b', 'LineWidth', 1.5)
title('Imported inflation')

subplot(2,3,5)
plot(PIE_oil_imp(1:52), 'b', 'LineWidth', 1.5)
title('Imported oil inflation')

subplot(2,3,6)
plot(PIE_food_imp(1:52), 'b', 'LineWidth', 1.5)
title('Imported food inflation')


sim_data = oo_.endo_simul;                           
var_names = cellstr(M_.endo_names);                 
sim_data_T = sim_data';                              

T = array2table(sim_data_T, 'VariableNames', matlab.lang.makeValidName(var_names));
T.Time = (1:size(sim_data_T, 1))';
T = movevars(T, 'Time', 'Before', 1);

writetable(T, '/Users/ani/Desktop/Endocred_final/csvs/endo_nonlinear_loss_LR_histval.csv');
