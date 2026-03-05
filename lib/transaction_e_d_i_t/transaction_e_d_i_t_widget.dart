import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionEDITWidget extends StatefulWidget {
  const TransactionEDITWidget({
    Key key,
    this.transactionDetails,
  }) : super(key: key);

  final DocumentReference transactionDetails;

  @override
  _TransactionEDITWidgetState createState() => _TransactionEDITWidgetState();
}

class _TransactionEDITWidgetState extends State<TransactionEDITWidget>
    with TickerProviderStateMixin {
  String budgetValue;
  TextEditingController spentAtController;
  TextEditingController textController1;
  TextEditingController reasonController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 170,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 80),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 230,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 120),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

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
    return Form(
      key: formKey,
      child: StreamBuilder<TransactionsRecord>(
        stream: TransactionsRecord.getDocument(widget.transactionDetails),
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
          final transactionEDITTransactionsRecord = snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.darkBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit Transaction',
                                style: FlutterFlowTheme.title1,
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 48,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.textColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: textController1 ??=
                                  TextEditingController(
                                text: transactionEDITTransactionsRecord
                                    .transactionAmount,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Amount',
                                hintStyle: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.grayLight,
                                  fontWeight: FontWeight.w300,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.background,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.background,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 24, 24),
                                prefixIcon: Icon(
                                  Icons.attach_money_rounded,
                                  color: FlutterFlowTheme.textColor,
                                  size: 32,
                                ),
                              ),
                              style: FlutterFlowTheme.title1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please enter an amount';
                                }

                                return null;
                              },
                            ).animated([
                              animationsMap['textFieldOnPageLoadAnimation1']
                            ]),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: spentAtController ??=
                                  TextEditingController(
                                text: transactionEDITTransactionsRecord
                                    .transactionName,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Spent At',
                                labelStyle: FlutterFlowTheme.bodyText1,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.background,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.background,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.bodyText2,
                            ).animated([
                              animationsMap['textFieldOnPageLoadAnimation2']
                            ]),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: StreamBuilder<List<BudgetListRecord>>(
                              stream: queryBudgetListRecord(
                                queryBuilder: (budgetListRecord) =>
                                    budgetListRecord.where('budgetUser',
                                        isEqualTo: currentUserReference),
                                singleRecord: true,
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
                                List<BudgetListRecord>
                                    budgetBudgetListRecordList = snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final budgetBudgetListRecord =
                                    budgetBudgetListRecordList.isNotEmpty
                                        ? budgetBudgetListRecordList.first
                                        : null;
                                return FlutterFlowDropDown(
                                  options: budgetBudgetListRecord.budget
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => budgetValue = val),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 60,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.textColor,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.grayLight,
                                    size: 15,
                                  ),
                                  fillColor: FlutterFlowTheme.darkBackground,
                                  elevation: 2,
                                  borderColor: FlutterFlowTheme.background,
                                  borderWidth: 2,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 12, 20),
                                  hidesUnderline: true,
                                ).animated([
                                  animationsMap['dropDownOnPageLoadAnimation']
                                ]);
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: reasonController ??=
                                  TextEditingController(
                                text: transactionEDITTransactionsRecord
                                    .transactionReason,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Reason',
                                hintStyle: FlutterFlowTheme.bodyText1,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.background,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.background,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 40, 24, 0),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.textColor,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 4,
                            ).animated([
                              animationsMap['textFieldOnPageLoadAnimation3']
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<BudgetsRecord>>(
                            stream: queryBudgetsRecord(
                              queryBuilder: (budgetsRecord) => budgetsRecord
                                  .where('budetName', isEqualTo: budgetValue),
                              singleRecord: true,
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
                              List<BudgetsRecord> buttonBudgetsRecordList =
                                  snapshot.data;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data.isEmpty) {
                                return Container();
                              }
                              final buttonBudgetsRecord =
                                  buttonBudgetsRecordList.isNotEmpty
                                      ? buttonBudgetsRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  if (!formKey.currentState.validate()) {
                                    return;
                                  }
                                  final transactionsUpdateData =
                                      createTransactionsRecordData(
                                    transactionName:
                                        spentAtController?.text ?? '',
                                    transactionAmount:
                                        textController1?.text ?? '',
                                    transactionReason:
                                        reasonController?.text ?? '',
                                    budgetAssociated:
                                        buttonBudgetsRecord.reference,
                                  );
                                  await transactionEDITTransactionsRecord
                                      .reference
                                      .update(transactionsUpdateData);
                                  Navigator.pop(context);
                                },
                                text: 'Update Transaction',
                                options: FFButtonOptions(
                                  width: 340,
                                  height: 70,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  textStyle: FlutterFlowTheme.title1,
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Tap above to save your changes.',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0x43000000),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
