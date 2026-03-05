import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRightChildWidget extends StatefulWidget {
  const AddRightChildWidget({Key key}) : super(key: key);

  @override
  _AddRightChildWidgetState createState() => _AddRightChildWidgetState();
}

class _AddRightChildWidgetState extends State<AddRightChildWidget> {
  String dropDownValue;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          StreamBuilder<List<UserHeirarchiesRecord>>(
            stream: queryUserHeirarchiesRecord(
              queryBuilder: (userHeirarchiesRecord) => userHeirarchiesRecord
                  .where('hierarchyUser', isEqualTo: currentUserReference),
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
              List<UserHeirarchiesRecord> containerUserHeirarchiesRecordList =
                  snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final containerUserHeirarchiesRecord =
                  containerUserHeirarchiesRecordList.isNotEmpty
                      ? containerUserHeirarchiesRecordList.first
                      : null;
              return Material(
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Child Heirarchy',
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: StreamBuilder<List<DelinkedUserRecord>>(
                            stream: queryDelinkedUserRecord(),
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
                              List<DelinkedUserRecord>
                                  dropDownDelinkedUserRecordList =
                                  snapshot.data;
                              return FlutterFlowDropDown(
                                options: dropDownDelinkedUserRecordList
                                    .map((e) => e.email)
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                textStyle: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 20,
                                ),
                                hintText: 'Select available child...',
                                fillColor: FlutterFlowTheme.darkBackground,
                                elevation: 2,
                                borderColor: FlutterFlowTheme.background,
                                borderWidth: 2,
                                borderRadius: 8,
                                margin:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                hidesUnderline: true,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: FlutterFlowTheme.title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayLight,
                              ),
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
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                                child: StreamBuilder<List<DelinkedUserRecord>>(
                                  stream: queryDelinkedUserRecord(
                                    queryBuilder: (delinkedUserRecord) =>
                                        delinkedUserRecord.where('email',
                                            isEqualTo: dropDownValue),
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
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DelinkedUserRecord>
                                        buttonDelinkedUserRecordList =
                                        snapshot.data;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data.isEmpty) {
                                      return Container();
                                    }
                                    final buttonDelinkedUserRecord =
                                        buttonDelinkedUserRecordList.isNotEmpty
                                            ? buttonDelinkedUserRecordList.first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        final userHeirarchiesCreateData = {
                                          ...createUserHeirarchiesRecordData(
                                            hierarchyUser:
                                                buttonDelinkedUserRecord
                                                    .userRef,
                                            userEmail:
                                                buttonDelinkedUserRecord.email,
                                            parentEmail: currentUserEmail,
                                          ),
                                          'hierarchicalParents':
                                              containerUserHeirarchiesRecord
                                                  .hierarchicalParents
                                                  .toList(),
                                        };
                                        await UserHeirarchiesRecord.collection
                                            .doc()
                                            .set(userHeirarchiesCreateData);

                                        final childHierarchyCreateData =
                                            createChildHierarchyRecordData(
                                          childRef:
                                              buttonDelinkedUserRecord.userRef,
                                          parentRef: currentUserReference,
                                          parentLeg: 'Right',
                                          childEmail:
                                              buttonDelinkedUserRecord.email,
                                        );
                                        await ChildHierarchyRecord.collection
                                            .doc()
                                            .set(childHierarchyCreateData);
                                        await buttonDelinkedUserRecord.reference
                                            .delete();
                                      },
                                      text: 'Add Child',
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowCircleRight,
                                      ),
                                      options: FFButtonOptions(
                                        width: 160,
                                        height: 50,
                                        color: FlutterFlowTheme.secondaryColor,
                                        textStyle:
                                            FlutterFlowTheme.title1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
                    StreamBuilder<List<UserHeirarchiesRecord>>(
                      stream: queryUserHeirarchiesRecord(
                        queryBuilder: (userHeirarchiesRecord) =>
                            userHeirarchiesRecord.where('userEmail',
                                isEqualTo: dropDownValue),
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
                        List<UserHeirarchiesRecord>
                            buttonUserHeirarchiesRecordList = snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final buttonUserHeirarchiesRecord =
                            buttonUserHeirarchiesRecordList.isNotEmpty
                                ? buttonUserHeirarchiesRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            final userHeirarchiesUpdateData = {
                              'hierarchicalParents':
                                  FieldValue.arrayUnion([currentUserReference]),
                            };
                            await buttonUserHeirarchiesRecord.reference
                                .update(userHeirarchiesUpdateData);
                            Navigator.pop(context);
                          },
                          text: 'Update Hierarchy',
                          options: FFButtonOptions(
                            width: 300,
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
            'Tap above to complete request',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: Color(0x43000000),
            ),
          ),
        ],
      ),
    );
  }
}
