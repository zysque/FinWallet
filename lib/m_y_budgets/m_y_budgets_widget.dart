import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../budget_details/budget_details_widget.dart';
import '../create_budget/create_budget_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MYBudgetsWidget extends StatefulWidget {
  const MYBudgetsWidget({Key key}) : super(key: key);

  @override
  _MYBudgetsWidgetState createState() => _MYBudgetsWidgetState();
}

class _MYBudgetsWidgetState extends State<MYBudgetsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 49),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 200,
      delay: 50,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 51),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 150,
      delay: 90,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 26),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.background,
        automaticallyImplyLeading: false,
        title: Text(
          'My Budget',
          style: FlutterFlowTheme.title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 220),
              reverseDuration: Duration(milliseconds: 220),
              child: CreateBudgetWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        elevation: 8,
        child: Icon(
          Icons.post_add_rounded,
          color: FlutterFlowTheme.textColor,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 120,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.darkBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 12),
                                  child: Text(
                                    '+\$12,402',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Color(0x4D39D2C0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5% ',
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                      ),
                                      Icon(
                                        Icons.trending_up_rounded,
                                        color: FlutterFlowTheme.tertiaryColor,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation1']]),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 120,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.darkBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 12),
                                  child: Text(
                                    '-\$8,392',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.errorRed,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Color(0x9AF06A6A),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5% ',
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.errorRed,
                                        ),
                                      ),
                                      Icon(
                                        Icons.trending_up_rounded,
                                        color: FlutterFlowTheme.errorRed,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation2']]),
                      ],
                    ),
                  ),
                  StreamBuilder<List<BudgetsRecord>>(
                    stream: queryBudgetsRecord(
                      queryBuilder: (budgetsRecord) => budgetsRecord.where(
                          'userBudgets',
                          isEqualTo: currentUserReference),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SpinKitPumpingHeart(
                              color: FlutterFlowTheme.primaryColor,
                              size: 40,
                            ),
                          ),
                        );
                      }
                      List<BudgetsRecord> listViewBudgetsRecordList =
                          snapshot.data;
                      if (listViewBudgetsRecordList.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/emptyBudgets@2x.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 400,
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewBudgetsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewBudgetsRecord =
                              listViewBudgetsRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BudgetDetailsWidget(
                                      budgetDetails:
                                          listViewBudgetsRecord.reference,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              listViewBudgetsRecord.budetName,
                                              style: FlutterFlowTheme.bodyText2,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: FlutterFlowTheme.textColor,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '\$${listViewBudgetsRecord.budgetAmount}',
                                        style: FlutterFlowTheme.title1,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                listViewBudgetsRecord
                                                    .budgetTime,
                                                '4 Days Left',
                                              ),
                                              style: FlutterFlowTheme.bodyText2,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 0),
                                                  child: Text(
                                                    'Total Spent',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xB3FFFFFF),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewBudgetsRecord
                                                        .budgetSpent,
                                                    '\$22,000',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style:
                                                      FlutterFlowTheme.title3,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).animated(
                          [animationsMap['listViewOnPageLoadAnimation']]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
