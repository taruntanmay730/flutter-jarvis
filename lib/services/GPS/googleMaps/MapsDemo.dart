import 'dart:async';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:convert' show Utf8Decoder, json, jsonDecode, utf8;



class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {

  String _polyLine = "__ecC{h||Laj}g_cBiBsF_CSA{B_AIA}BaAIAyCoAKA{GoCU?eHoCUCcHsCU?_HsCU@eBs@Kh@_Bu@c@p@yCkAW_@oDiASSeD}@OK}FeCWEiFsCSM_GcCSE_G_CS?{FcCS@_GaCSAaCy@I?aCw@I@{C{@K@uGeBU@yGcAWJcFi@UJwEQSCwBCIGcC@IGkDHKK{Hl@SKuH~@S@_HpASD_HpBUFiGlCUB}FhDUAqFbEU?iEfES?}DxESA}D|ES?wDvESBiDlESDuAdBKPwA`BwBjAqAxAQk@_CfCUM}@jAII_ArAICkBlCOEiDlFWEgCdFSIwBjFS@eC|ES@}A|BKAgErFW?_E`FUCaEbFU?qDnESAqDpES?wDtESAwDvESA{DxES?_BnBIA}AlBI?qB~BK@gFvEUAaGxDUAiFjEUBaEtEUF_DjDSJcDxCS@yAtAIGaBvAIE_CrBKIkFpESIsDzC[v@aCrBSAuArAKIwEjEYIoD|CUBuCjCSB}ArAKA{ElEYGaFlEUQiFhESKcEhCSXiE`BSDmBj@IEsBh@ICkD|@ME{G`BUCaHfBUCsGdBUDkFrASDaFrASBmFzASEsCt@KAkGjBU?oGhBUAiGdBUBuF~AUDsAjCkCvA{ADiAAu@tAkA?kDcAq@SsC{@}@HiFu@g@[eD{@SUiC}@OEwFaBWKmFyASKqF_BSCwF{ASA{Bo@I@}Bo@ICwCy@K?gEoA[n@sAa@SV}Bq@SQcD_ASOaCo@MIuGgBYIoFqASI{FwASE}FyASAwFyASB}Bm@IA{Bm@I@wCq@KAoGeBWHmG_BW?iFsASAuFkASCeGyASGkGgBSCeCy@IAgC{@IAeDiAKAyGsBSAgHcCUDuGyBUDoGuBUB{G}BUE{FmBS@}FmBS?aGqBSAeGsBSAaGmBS@wBs@IF{Bu@IAuC{@KAyG{BUC_H_CU?_HwBU?}GaCU?gGoBSAsFeBSF_FaBSHaF_BSAqC{@KE_HwBUGmH_CUEwG_CUFyGaCUAaGyBS?cGwBSAeGoBS?kGyBSAwGcCSEeHkCSEyG{BSDcCy@IDaCu@IDqCeAKB{GgCW@{G_CUG{G}BU?uFoBSDyFkBSAwFoBS?yFiBS?uFiBS@{Bw@IAyBu@I@oC}@K@yGuBWBmGqBUEsGwBUAeGiBSCsGaAS?sG}@S?uG_ASA}F{@SHgBUK`@aFu@[BiEm@SOqBYIKuB[ICeDe@M@gGiAWDiGcAUIiG}@SGsGw@SCoG}@S?qGaAS?gC_@I?eCa@I@aDc@K?aHeAU@kHeAUCmHeAU?iHgAU?wGcASA{GcASA}GcASA{GuAS?sGeBS@gCo@I@aCq@IB{Cw@K?_HkBUA_HiBU@}GiBU?{GkBU?}FaBS@{F_BS@{F_BSA{F_BS@aGwASA}Bq@I?aCo@IA{C{@K?{GqBU?{GqBU?}GkBU?{GiBU?yF}ASBcGaBSCeG}AS?iG_BSAiGyAS?}Bm@IDyBm@I@sCs@K?sGeBUAyGgBUA}GgBUA_HkBU?iGaBSAaG_BS@kFqASHiFuAS?mC{@KAmHoBUMiHmBSIoG}AUTmGaBU?aHaBUEqGcBSEmGcBS@cGmBS@qG_BSCsG_BS?gCq@I?iCo@I?eD{@K?kHmBU?cHiBUBgHeBUAiHiBU?eG}ASBaG_BS?gG_BS?gG}ASAsFsASHqCs@KA}GgBUEaHoBUAiHkBUAiHqBUAmGeBS@iGgBS?iGiBS?iGeBS?eGgBS@aCq@I@cCu@IA_D_AKAcHiBU@eHkBU?qHmBUEiHqBU@oGaBS@kG}AS@iG}AS?kG}AS?eG}AS@cCm@I?cCq@IA_Du@K?_HgBU@aGqCUByEyEUAeFkEU?wF}BSAaGgBS?kGk@S?sG`@SAoGVSBeCWIAaCm@I?{Cw@K?_HiBU?_HkBU?}GiBU?}GiBU?cGaBS?aG_BS?_G{AS@}F}AS?aG_BSAcCm@I?aCq@IA}C{@K@sGkBU@qGcBWJsCk@Uf@cCq@uEp@sD_AuPBaBs@Si@_D_ASW_Be@IOkBk@IGuCu@M@qGcBWE{FuAU?}EiAS@sEiASBqBi@IEwBk@IEqD}@MCuHqBUKuHoBSKqHmBS?cHmBSDsHqBSEgIuBSGuHmBSFkGeBSNsGeBUF_IkBUOyHwBSK{HsBS?qHuBSBkHqBS@cHcBSD{FwASNmEgASPuEsASA{Cw@KSsGeBSEuGcBUFsG{AUBaHiBUGaGgCQMaGcGSOsFiGS@kFiGSBkFcGS?gFwFSDoF{FSCmE_HS?sCmGSPqBaFSRgCuFSI_EiFSIyBwAIAcCmAIAiCoAICmCuAIEkCsAI@aCqAID_CgAIDuBgAIFyBqAKJiEeEYJwBeEUBsAwESEk@{BKB}AsGYAsAyFUEgAqESFuAkFSKu@_DKKkB_IUGuDgGSG}FyESGiGwESCoHkCS@uHgCSAaFyFSB_CsHSDuB{HSAmBwHS@mBoHS@uB_ISEuBeISAwBeIS?uB_IS@sBaIS?iBeIS?k@sIS?YuIS?kAkIS@mDwGS@{F}DS?aHwAS@yGo@UPkH}@YHqGoASSeHiBSIaIq@SEyHf@SBgIl@SEgIl@S?iIl@SAgI^S@eId@S?gId@S?_Ib@S@_Hh@SL_Gl@SJoGt@SEaHv@SGwCZIEwC\\I?}C\\IC}C\\I?{C^I@{Cl@IC{Cj@I@uCn@I@uCn@I?uCp@I@uCp@ICyCn@I?{Cr@IAmCl@IH}Bd@K`@sFtA[JaEbASG{EdBSMwBz@II_C~@IGeDx@KA{Fv@W\\yFr@W@qFd@SMmGs@SK_GcDSIkFwDSB}BeAI@aCq@IB}Ci@K?sHmAUC_IWUA{GnAUFyFvAUJcFnAS?uFpASGgG`BSGaCl@I@uBh@IJoCt@MJuGbAYA{FVSKaGXSC_CNI?oFXQC}GXUB}FGS@_GeASCeF_ASHyB_@IC{Bc@IAuCi@KAaHuAWBsGmAUCeHyAUEoHsASOeIs@SEwGYSPcG[SH{GYSIkHa@SEcHgBSCgG_ESC}E}DSLkEkDSHsB{AKFgFoDW@}GyBWGoHq@SSsIy@SOkJo@SImIj@QAmIr@Q?oIh@Q?mIv@Q?oIt@QAyD\\I?sJfAS?sJp@S@cJnASBoIpDSCcHxCQDgGpBUf@qEv@SP{E^SAiC?KCeGs@WBqFwBW?}DeDSIeDmGSUwB}ISQiCuIS?mCuISAkCaJSAqCeJSCqCaJS@oCsISDwCkIS?yEwGS@cGsFSA_GqFS@aGmFS?iGmFSA{FmFSBwFkFS@oF{ESDqF{ES?uFuES?wFuESAeFqDSLuDyBSZyA_AI?}AaAICkCaBMCeG_EWKkGoEUMkFcES@oFiESCkFaES@wE{DSFmEoDSDuEyDSCsBuASt@eCcCwEp@sCaCWy@wC_CSMqBeBMEcFcEYE_E_DSGgEaDSAeE}CS@wB_BKAuFgEWAoFkEUG_GcEUCgF}DSAcFwDS@wCaCSb@uAiAKBwEmDYIuEmDUMeF{DSQqF}DSCyEoDSJqDoCSR_BqAIIeBqAIC_CeBKCqFcEUCyFmEUCcGqEUCeGsEU?mFuDS?aG}CS?qGyBS?yFoASL_Gs@S?_CMI@}BII?uDIMAqHOUGcIWSQaIa@S?iHMSH_ISUBsHSUBuGQS?wGUS?sGUS@sGUS?sGWSAmCMI?kCGI?gDMK?oHSU?kHOU@cHQUB{GOU@oFISFyEGSFsB?ICuBLICsDn@MIgHdDUMsFdESAeGbEUDeGhEU?qFzDSCuF~DS?kFvDSB}EnDSD}EjDS@cFtDSEsBrAI@sBjAIBiChAKBgGxBWFkGbCWA_GtBSMeG~BSCkFzBSJ{EtDSEwDzES?kAxBI@}@bCIA}@bDK?aBpHU@}AbHUB}A|GU@yAjGUDsAvFSAyAbGSCsAdGS?y@~CKC_BhHU?cB`HU@}AvHW@mAnGSCuAfGS@uAxGSEoBpGS?kBjGS@m@~BIDe@rBIHk@~BO\\k@tBWTuA`Eg@?{@lC_@BwAvE[YuAxESYaBxFSKm@hCIGk@lCICo@rDKAsAhIUA{AfIU?_BbIU@}AbIU?qAzGSBiA~FSH_ApFSFc@xBIAk@|BIEwAnDMEcEnGUIcDhHU?eBnHUFgApGS@oAtGSAoA`HSCwAlHSCgCzGSAgAdCI@gAdCI@aAfDK@eBtHU?aBdHUF_B|GU@}A~GU?sAnFSD{ArESHw@vBK@_CtFYBkBpEU?yAhESCu@fCKE}ArHWIq@zHUG@hIUA`@dHS?[fGSJgBjFS@qAhBIGeBbBICcCxBKG{FfFUCeFfEUJaFnEU?}E`FUAcEnES?cElES?yDxES?sDbFS?wDbFSAyAjBIB}AxAIFqC~AM@sGvCWCsGzCUKoFdCSDeEdBSRuD|ASDoCjAO@cFzBWEsEtBSIqFdCSKsGxCSOsGxCS?wFfDSDkB|AIF{AdBIBiBdCKA}DzFUAaExFU?kEpFU?eFtEU?kE|DS@cE`ES@iDtES@oD|ESCuDzESAiB~AI?kB|AIAyBlBKDwExDWLgFbDW?{EnCSK{F|CSKgGjDSGaGjDS@oF|CSHsBhAIBqBjAI?aC|AKBaGnDW@wFtCUA_GfDUCmDtES@cCfFSBcAvGSC{@rHSI_@xCI?]rCIB_@lDK@s@zHU@}ArHU?iApHU@{AbHU@mBhGSCqA|GSAk@rGSDa@vFSHSrBIF]tBICi@pDMEqA|HUOu@rIUCg@tGUTQjGSEIzGSEIlHSECzCICCvCIBApCKTCpHY@e@lHUMcClGSIgEfFSCiElFSCiEdFS@aBrBI?cBtBI?wBjCK?gF~FUAwFfESC{GbCS?sGzBSB{HfAU@}HOSIkHaBS@wGmBSFuEq@QRyB_@yAtAqAu@SYyBSSKyCPSKsCx@SAqAn@K@{DvC[EqC`CSEmAfAIGoAfAIAcCjBO@cEhDWAiDlCSAuDvCSE}BjBKM_GnEUIyFlEU@_FxDUJgEfDUHmDlCSB_EvCSEcCdBKMcGhEUGcGhEU?oF~DUFiFxDU@oDfCOAyEjDS?sEdDS@kBpAI?kBrAI?aCbBKAgFtDUBiFrDU?gFfDU@_FvDU?yElDSEwEjDS?gE~CSFcBlAI@cBlAI?sCpBMEaGlDUGeG|CUBwFjDU@iF`DSEaF`DSBiEdDSDiEdDS?gBtAICgBrAI@_CdBKAgF|DU?iF|DU?uEpEU?oElEUB}D`ESAwD|DS@yDxDS?{A~AI?{AxAI@_C|BM@oEdEWDmEvDUCoErDSIyDjDSFgDnCSJqB~AMB{ErDYA{DrCSIgEfDSGyExDSGiBzAI@gBvAI@uBfBKByEvDWHkEjDWDwDzCSGiEfDSGmEhDSAcBvAI@{AtAIBaCpBM@{DdDYTaBjAcGdAuBbBg@YyAjASOoBzASIgCpBSKmCvBSCmA~@IEkA~@I?eCjBQBkDjCUCcD`CSCeBrAKC}EnDWE{FfEWKuElDSCiE`DSF{DtCSFwAdAI@{AfAI?eChBMCeFzDWAmErCUDsD|BSBsDpCSCmBzAKAmEpDWBsD~CWH_DnCSCwAjAIGyAnAICeCpBMCyE~DWB_EdDUBqDtCS?_ElCSAsBpAK?_FtC[NmCbBSFyChBSC{CrBQKsEbDUIsEdCSCeEfCSB_BbAI@_B`AI?kC`BMCmFbDW@{EvCUAgEhCS@iEpCSCeBfAI?gBfAI?mClBMAeFhDWFgDrBUR_C|ASH{BxAQCgDjBUEaDxBSGoBpBMGiE`FWImE`FUGoDbESBqC`DSPyBdCSLkBvBQ@kCxCUCoCzCSI_BjBKKkEbFUKmEbFUAuEbFWFiDvDSBkDfDSBiDfDS?iBbBKAqElEW?iEdEWByCrCSFsCnCS@cB`BM@oDfEY?cC~CSA}@nAIBmDnE]DwBxBSBeCbCSEkCzBQGkDpDUEuClCSDqAtAKBmElE[CyCzCSC}CtCS?_B~AKCkEhEWC_E~DWBaBbBS`@aAdAOF_AlAWLyBvBe_@\\eEtEg@u@wB|BSK{BdCQImDzDUKiDrDSCsDvDSEmBrBKCgEvEU@eErEWHuDjEUCcEnESMwEnESEsEhES@mErDSFgBxAIAkBzAIAaClBK?uFpEUC_FpFU?mEfGUAqEbGU?_EvFSCcEvFS?yDlFSDiDtESHsDrESA_ElFSKgBzBIEiB|BIAiBxBI@aBtBIDmBlCKBcDdGUFeA|HUCLjHUFxA|EURxBhDS@dAzAIGhAfBIGzAjDMIl@tIUIaBlHUFsDrGWB_DrFSEcD`GSEeD|FS?{CtFSDaDnFS?qAvBI?qAtBI?gBbCKBuEjFUEiExEUFoEfFWBcElESIuDlFSCyCdFSHyCrESB{A`BIC_BfBICyBzBKCcFhFUAuE|EUDcFfFWBiEpESGuExESEmExES@gE|ES?eExESBaBfBI@}AfBI@oB~BK?iE|EWJqDnEWF_DlDSAaDxDSCoA`BICmAfBIAqBlCM?oErEUC{EjEUAmFjDU@oE|CS@qDjESAaEtDS@uEvDSEeBzAI@yAxAIFwBbCM?uElFWC_FjFUKoEdFSEeEzESDoD|ESDqDbFSAkD`FS@gDxESBwAfBIAyAfBI@mBvBK?qEdFUCgErFUAgExFUAuDdGU@_DpFS?eDrFSAoDhFS?uD~ES@aErES?yAbBIDoAbBIF}AhCMB{CvFW?}C|FUKkCbFSB{BpESF}@dBI@aA`BI?cBlCMCoEdFWCsF~DUKkG|BSEsGfAS@eGh@SF_GSSB{BGI@wBEIBgDIM?gHQWAoGOU?_GGSCgGfASEoErCSFyArBKFuBlGW?i@hHWAUxGSI[hHSE]pGSFMlCIAOfCI@OfDKAc@fIW@]rHUA]nHU@UpGS?IhGSBYrGSCKjCIAMlCIAOdDKBUdIW@K|HW@ChGS?CxESN@pBIA@rBIACzDOAI~GW?SxFSCGhGSE?fCIC?lCIAAdDK@?lHWFAbHWBCbGSEC`HSK?pGSFD|CK@A|HW?CxHW@?fGSA?fGS?CfGS?AzCK@GdIWCBtGWL@tESFA`BIB?`BI@CtDQA?pFUGCzFSI?`HSO?vCICApCIBAlDK?AbIU?CxHU@ArHUBE~FUNM|ESBUjBI?[bBIBu@`DQF_AlDUFy@lDSE}@pDQI}AfGUQuAvFSAoA`GSAg@`CIAg@~BI@s@xCMLmAvFYJ_A`ESAa@`BI?_@xAIBw@`DQ@cAlCyBz@e@dC]WgAxAQO{@fDWCcA~CSKiAjESOoA|ESEo@lCKEgBfHWCmBpHWA{AtFS@oA~ESHc@zAILa@|AI?m@bDQB[nFUIMbGSOGnCIKGxCIEIxDK?S`IUDShIWDSrHUACrGS@FpGS?H`HSEThHSADpCI@FnCI?BjDK@FxHU?FfIUCZpHUD|@lHU?dArGSA`AlGS@`AdGSB`@bCIA^`CI@l@nDMBnAxHWClAzHUI~@xGS@~@jGSD~@`GS@`@bCI?^~BI@j@pDM?d@lHWBy@nGU?aC~ESC{C~ESE}C~ES?oApBIAkAnBIBiBxCM?oDzFWBkDvEU@aD~DS?sC~DSBcAxAIBaA~AI@}AxCO?oB|DWNoA~BSLkAzBS@yAnCSI{@`BKGyC`GYOuCnFUIkCpES@kClES@cAfBI?gAzAIDeCnBO@{EbBWDqDVSFeBIK@gBUK?_Di@QAwEy@UIkEw@SAaBc@I?aBc@I@cDg@OAmGQWEoFHSE_F\\SDqBXKJwFhA[BeE|@SGmFjASQeCh@IIgCj@ICqCn@KJwFrBYP{DfCU@qDzBSAwAz@I?wA|@I?qCdBOAaF`DWCgElCSEcEfCSByA~@IDyA|@I?qCfBO?uEvCW?uD|BS?sD~BS?uB|AM@eEjCYHqAv@Sb@aAxA_}Td@}E~Bgbf@?kDvBSqAeEnCSMoBlAIIqBpAICgCdBK?}FnDU@{FvDUAqGxDUGkGtDUBkFdDS@mFhDSA}FjDSEiHnESU}GnESB_G~DSJyFxDSDqFjDSBuFlDSAiFdDSDoBlAIBuBbAI@iCvAKAsFvDU?sFhDU@aF~CWNuD`CSBgEjCSIoBlAIKsBnAIAgC~AK@qFjDU@sFjDU?wFlDUAqFfDUBwErCS@}EzCSCyExCS@sErCSB_CxAKA{FpDUEsFhDU@kFlDU@qFhDUA{ExCS@yErCS?aFlCS?oEnCSDiBdAI?iBjAICeC|AKEqF~CUDuFbDWDgFtCUAaFtCSGgFnCS?aFvCS?cFxCS?oBhAI?qBjAIAiCvAK@wFfDU?wFdDU?eGlDWB{ErCSAqFbCSCwFvBSAqFxBSBkFlBS@uBv@I?wBt@I?qC|@K?oG`CUCoG`CU?oG`CU?mGvBU@sFrBS?uFrBSAsFrBS@mFnBS@kFjBS@eC`AKBiEjBkBpAqDpAg@UgDjASa@sBv@KMcGvBWGiGtBWAgFjBSEuFrBSE}FzBSCsFrBSDqBt@IDqBl@I@aDRMBcHWWCoGUUAyFMS?wFIS?_CAIA}BGI@oDGMAoHOW?wGMU?aGOSAaGMS@aGMSAaGMS?sCIKBkHOW?qHQWAaGOSA}FKS@{FKS?aCGIA}BII@}Ck@MFcGiBW@uE{@UJkE[SAmB?IEqBDICyCZM@_C\\eNvAeBNQk@kD\\UO}ALIMeBPIEiD^OCuGt@WGiFZS?qF_@SC{FWSAuCAK?gHEW?yGEWDkFGS?mFaASE}FcBSG_Cs@IA{Bq@IBqCy@K@}GwBW@}GqBW?uFk@S@kFj@SBkFx@S?iCb@K?kGbAWBwGfAWCeDb@SZqDP{@j@wBBOc@kCBWLqEJg@ByB@OSaF?WMmEDSE}A@ID{ABI@{ABSd@eAzDq@DBbDS]JdESMAzCSN@fCMMR~HYQh@`HSQp@lHSCn@nHSAl@hHS@l@dHS@VtCIAVrCI?^rDK?jA|HU@hBlHU@pBhHU?`BlHU?d@|GS@^|GS?^|GS?^~GS?X`HSALrCI?JpCI?PhDKBZnHU@ThHWHPjFUJNzESAFrBICHvBIAJrDMETtHUIXfIUEXnHUFLrCSn@FjG{@T?bBIi@K`BI@YnEQM{@`HUMeBbFSDsBnESBw@rAKXuB`Do@^}AnBSWuBbD{@\\}BxB_@O}AvBSO}AtBOMiDrEWMeDlESMuDpESEwD|ESCyAjBI@qA`BIHoAlCMHc@~GWASzGSMYtHSIWrHS?_@bJWBMjFSTKtBg@`AKbEaDLGdBy@EQhCcAA?zBkDHKjBaBAKxBsC@WrCcBEUbDSq@QpESOMvCKO]|HWC]fIUKWpIUCWpHS?QnHS@SjHS?YlHS?UfGSLKbDKC]hIUIStIUAy@bIU@a@`CU`Ao@bBSBmBrGa@WwAbFSYuBnFSGuClFSEmA|BIEsA~BICiBzCKAwDjGSCoDjGS?mEpFS?cGhDS?sGhDUDmGbDUBqGhDUAqGhDU?yFxCS?sFtCS?uEbCSNgDdBST{BlAMEkFtCYAqEhCSMiF|CSKqFxCSAsEpBSPcBz@Qh@wAf@UPyAf@SE{B^SKcD`@QUsFLUOoDKSRyEU_Ah@aHMg@]qDVSM}Bj@MC}DrAYJoEx@yEv@cBp@_IDeDpAcLAwBv@kCCuAf@S]}ChAS]{Bv@KUsGrBWIqGtAUCwG^U@aG?SA{FGSBkDKS^iCD_@`@{DK[SkDISMmCIOCkBKWb@}AH_@JW`Dc@IAtBM[CvBYZA`DQ_@CrGUYAlHSSCtHSAAtGSJElCKLAfHWAErHWCAlDS\\BjCoAr@?tBS_@A`BKOA`H[O?lES?JdGSSPlDKKn@xHU@bAdIUEbAnIUClAzHUD`@`CSz@l@nEg@Hf@vDQe@v@~FUIn@fFS?TbCIKXlCIEj@pDKEt@dFWd@P`CW`@ExCO]g@hHWUg@`HSOi@tHSGK~HSAD~HS?B|CI?DzCIB@vDK?BhIUB?jIUADtIUABrIU?AxHSAI`ISAObISAInDg@vAWpFg@KIdEQe@KhHUQKrHSMM~HSCMzHS@OtHS@CxCI@CtCI@EfDKDIpHWHKpGWHC`DSVVjBuBt@`Dt@k@YpCpASa@~BpAMQfG|CWOzFbDi@j@zBlBSGjChDSS`BxCc@l@jBbDSc@jAjCMKN|CKKPdDKCPnCICLhCI@XxDMDKnHWBy@bIUOu@pHSCc@fGSN[xBg@hA[xBSU_@lDSQWnCMMo@~HYMm@~GSOu@zFSJ{@hESPe@fBOXq@jDWCoArHg@CeAjFS]sAhGSMk@lCIEu@hCI?yBlBKBeBn@Op@wAb@SPsCpAS[gCbAMSsG~BWMqGdCUIaGzBSCaGbCS?}F`CS@}FxBS?sF`@Q@eDi@KCsFaEUBcB{AW`A_DpBs@LmAfBMg@iEvFYWyDjFSS}DrFSCkDjFSFcD~ESBmCzDSNoAhBOXkAbBWV}@nAS@_CxCcBT}BrCSy@{AhBOFwBpDgBp@qBlDS}@qArBKK}DnFWG}DrEWDcDhESEaCrDSLiA~AIGmAhBIGoBpDMKgDnHUEcDfHU@sCxGUF{BrFSDuBlFS@}BjFS?_AvBIA_AxBIAmApCK?oCpGUAuClGU?oCnGU?kCjGU@_CjFSB{@pBKPuA~C{@z@uAbDSo@s@bBIMq@pBIGeAjDME}AhHUG{AtHUCmBdIUE}AhHS?_BbHS@}A|GS@}AvGS@eArGSBYdCIDa@|BI@cAtDMEiBbHUAmBjHUAmBpHUA_B~FSFaBdGSA}A`GS@q@bCIAo@bCI?y@~CKAkBfHU?kBfHU?kB`HU@kBdHUAcBlGSAaBhGS@_B`GSByApFSDq@~BKH{AtF[NmAvESO}AvFSKs@|CKEo@rHU?{AdHU?gBhHWDHxBY|@hC|@e@BzBp@UOhBh@OGpC~@cDn@pFxAg@k@lDj@SSzC`AOKhGxAWGlFtASGxEfDSEzEtCS@bEfBSNdC`AMBdGpCYG`F`CSI`FpBS@rErBSBrBtAK@pDdFW@nCjGWCfCpFSGlCrFSAlCrFS?jCpFS@hCnFS?dAvBIAbAvBI@nAjCK@zA`HU?\\xHUCZnHUBz@lBIF~CRM@lF_@SC`GMSGlGISCfCCIAhC@I?bD@K?jHTU?dHVUBzGNU@`Hx@UC`Fl@SN~Cd@g@z@|B@O_@nFBWO`F?SIjFASCpC@KArH?WGhH?UCvG?UDbGDSAjG@SCbG@SBpD?S`@t@_Ck@l@}@oAao@V{CO{ZAcB?inU@";
  late Set<Marker> markers = {};
  final Set<Polyline> _polyline = {};
  late List<PointLatLng> result;
  List<LatLng> latLen = [];

  // created controller to display Google Maps
  Completer<GoogleMapController> _controller = Completer();


  int numDeltas = 5; //number of delta to devide total distance
  int delay = 50; //milliseconds of delay to pass each delta
  var i = 0;
  double? deltaLat;
  double? deltaLng;
  var position; //position variable while moving marker


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latLen = decodeCustomPoly(_polyLine);
    position = [latLen[0].latitude,latLen[0].longitude];
    addMarkers();

    Polyline polyline = Polyline(
        polylineId: PolylineId("poly"),
        color: Color.fromARGB(255, 40, 122, 198),
        width: 4,
        points: latLen
    );
    _polyline.add(polyline);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      Container(
        padding: EdgeInsets.only(bottom: 20, left: 20),
        alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            child: Text("Play Route"),
            onPressed: (){
              while(i<latLen.length){
                //latitude and longitude of new position, & start moving marker
                var result = [latLen[i].latitude,latLen[i].longitude];
                print("transition result: $result");
                transition(result);
              }
            },
          )
      ),
      body: SafeArea(
        child: GoogleMap(
          //given camera position
          initialCameraPosition: CameraPosition(
            target: LatLng(latLen[latLen.length-1].latitude, latLen[latLen.length-1].longitude),
            zoom: 6,
          ),
          // on below line we have given map type
          mapType: MapType.normal,
          // specified set of markers below
          markers: markers,
          // on below line we have enabled location
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // on below line we have enabled compass location
          compassEnabled: true,
          gestureRecognizers: Set()
            ..add(Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer()))
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
          polylines: _polyline,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
    );
  }


  addMarkers() async {
    markers.add(
        Marker(
            markerId: MarkerId(latLen[0].toString()),
            position: latLen[0],
            icon: BitmapDescriptor.defaultMarker
        )
    );
    setState(() {
      //refresh UI
    });
  }

  bool transition(result){
    return moveMarker(LatLng(result[0], result[1]));
  }


  bool moveMarker(LatLng position){
    var latlng = position;
    print("moving marker: $latlng");

    setState(() {
      //refresh UI
      Future.delayed(Duration(milliseconds: delay), (){
        markers = {
          Marker(
            markerId: MarkerId(latlng.toString()),
            position: latlng,
            icon: BitmapDescriptor.defaultMarker,
          )
        };
        i++;
        return true;
      });
    });
    return false;
  }


  decodeCustomPoly(String encodedString){
    List<int> bytes = utf8.encode(encodedString);
    List<LatLng> myRoutePoints = [];
    int idx = 0;
    double latitude = 0;
    double longitude = 0;
    int ts = 0;
    int speed = 0;

    while (idx < encodedString.length) {
      int byte;
      var res = 1;
      var shift = 0;
      do {
        byte = ((bytes![idx] as int) - 63 - 1);
        res += byte << shift;
        shift += 5;
        idx+=1;
      } while (byte >= 0x1f);
      var deltaLat = ((res & 1) != 0 ? ~(res >> 1) : (res >> 1));
      latitude += (deltaLat);

      shift = 0;
      res = 0;
      do {
        byte = ((bytes![idx] as int) - 63);
        res |= (byte & 0x1f) << shift;
        shift += 5;
        idx+=1;
      } while (byte >= 0x20);
      var deltaLon = ((res & 1) != 0 ? ~(res >> 1) : (res >> 1));
      longitude += (deltaLon);

      res = 1;
      shift = 0;
      do{
        byte = ((bytes![idx] as int) - 63 - 1);
        res += byte << shift;
        shift += 5;
        idx+=1;
      }while(byte >= 0x1f);
      ts += (res & 1) != 0 ? ~(res >> 1) : (res >> 1);

      res = 1;
      shift = 0;
      do{
        byte = ((bytes![idx] as int) - 63 - 1);
        res += byte << shift;
        shift += 5;
        idx+=1;
      }while(byte >= 0x1f);
      speed += (res & 1) != 0 ? ~(res >> 1) : (res >> 1);
      myRoutePoints.add(LatLng((latitude * 1E-5), longitude * 1E-5));
    }
    return myRoutePoints;
  }
}
