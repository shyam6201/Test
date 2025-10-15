<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>

    <html lang="en" ng-app="birthReportAppFull">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FORM NO.1 - BIRTH REPORT (AngularJS - Fullest Attempt)</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
        <style>
            /* CSS from your "exact replica" example - ensure this is complete and accurate */
            body {
                background-color: #e9ecef;
                font-family: 'Arial', sans-serif;
                font-size: 10px;
                color: #333;
            }
            
            

            .form-page-container {
                background-color: #fff;
                padding: 15px;
                margin: 20px auto;
                max-width: 950px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                border: 1px solid #ccc;
            }

            .form-header h1,
            .form-header h2,
            .form-header p {
                margin-bottom: 2px;
                text-align: center;
                font-weight: bold;
            }

            .form-header h1 {
                font-size: 14px;
            }

            .form-header h2 {
                font-size: 12px;
            }

            .form-header p {
                font-size: 9px;
            }

            .section-title-bar {
                font-weight: bold;
                font-size: 11px;
                padding: 3px 5px;
                border-bottom: 1px solid #666;
                border-top: 1px solid #666;
                margin-top: 5px;
            }

            .section-content {
                padding: 8px;
            }

            .field-group {
                display: flex;
                align-items: flex-start;
                margin-bottom: 2px;
                padding-bottom: 2px;
                border-bottom: 1px dotted #f0f0f0;
            }

            .field-group:last-child {
                border-bottom: none;
            }

            .field-label {
                min-width: 190px;
                /* Adjusted slightly */
                padding-right: 5px;
                font-size: 9.5px;
                display: flex;
                align-items: flex-start;
            }

            .field-label .label-number {
                min-width: 20px;
                font-weight: bold;
                padding-right: 3px;
            }

            .field-input-area {
                flex-grow: 1;
                display: flex;
                flex-wrap: wrap;
                align-items: center;
            }

            .field-input-area.column-layout {
                flex-direction: column;
                align-items: flex-start;
            }

            .field-input-area .sub-field {
                display: flex;
                width: 100%;
                align-items: center;
                margin-bottom: 1px;
            }

            .char-box-container {
                display: inline-flex;
                align-items: center;
                margin-right: 2px;
            }

            .char-box {
                width: 16px;
                height: 16px;
                border: 1px solid #555;
                text-align: center;
                padding: 0;
                font-size: 10px;
                margin-right: 1px;
                border-radius: 0;
                box-shadow: none;
                outline: none;
                line-height: 14px;
            }

            .char-box:focus {
                border-color: #000;
                box-shadow: 0 0 1px #007bff;
            }

            .char-sep {
                margin: 0 1px;
                font-weight: bold;
                font-size: 9px;
            }

            .plain-input {
                border: none;
                border-bottom: 0.5px solid #666;
                border-radius: 0;
                padding: 1px 2px;
                font-size: 10px;
                width: 100%;
                box-shadow: none;
                outline: none;
            }

            .plain-input.name-part {
                width: 32%;
                margin-right: 2%;
            }

            .plain-input.name-part:last-child {
                margin-right: 0;
            }

            .plain-input.short {
                width: 100px;
            }

            .plain-input.medium {
                width: 180px;
            }

            .plain-input.inline-short {
                width: 140px;
                display: inline-block;
                vertical-align: middle;
                margin-left: 5px;
            }

            .form-check-label {
                font-size: 9.5px;
                margin-left: 2px;
                vertical-align: middle;
                cursor: pointer;
            }

            .form-check-input {
                width: 11px;
                height: 11px;
                margin-top: 1px;
                vertical-align: middle;
                cursor: pointer;
            }

            .instruction-text {
                font-size: 8.5px;
                color: #555;
                margin-left: 5px;
                width: 100%;
                display: block;
            }

            .sub-label {
                font-size: 9px;
                margin-right: 3px;
                font-weight: normal;
                min-width: 110px;
                /* Adjusted for better alignment */
            }

            .registrar-fill-area {
                border: 1px dashed #999;
                padding: 8px;
                margin-top: 10px;
                font-size: 9px;
            }

            .declaration-text {
                font-size: 9px;
                line-height: 1.2;
                padding: 5px;
                border: 1px solid #ccc;
                margin-top: 5px;
            }

            .signature-line {
                border-bottom: 1px solid #000;
                height: 15px;
                margin-top: 8px;
            }

            .signature-label {
                font-size: 9px;
                text-align: center;
            }

            .form-columns {
                display: flex;
                gap: 10px;
            }

            .form-column-left {
                flex: 0 0 58%;
            }

            .form-column-right {
                flex: 0 0 42%;
            }

            .statistical-note {
                font-size: 8px;
                text-align: center;
                border: 1px solid #666;
                padding: 3px;
                margin-bottom: 5px;
                font-style: italic;
            }

            @media print {
                body {
                    background-color: #fff;
                    font-size: 8pt;
                }

                .form-page-container {
                    margin: 0;
                    padding: 2mm;
                    border: 0.5pt solid #000;
                    box-shadow: none;
                    max-width: 100%;
                }

                .form-header h1,
                .form-header h2,
                .form-header p {
                    color: #000;
                }

                .section-title-bar {
                    border-color: #000;
                }

                .field-group {
                    border-bottom: 0.5pt dotted #666;
                }

                .char-box,
                .plain-input {
                    border-color: #333;
                    background-color: #fff !important;
                    color: #000 !important;
                    -webkit-print-color-adjust: exact;
                    print-color-adjust: exact;
                }

                .plain-input {
                    border-bottom: 0.5pt solid #333;
                }

                .statistical-note {
                    border-color: #000;
                }

                .registrar-fill-area {
                    border-color: #666;
                }

                .signature-line {
                    border-color: #000;
                }

                button,
                .no-print {
                    display: none !important;
                }

                .form-columns {
                    gap: 3mm;
                }

                .field-group,
                .section-content>div,
                .form-check {
                    page-break-inside: avoid;
                }
            }
        </style>
    </head>

    <body ng-controller="FormControllerFull">

        <div class="form-page-container">
            <div class="form-header">
                <h1>FORM NO.1</h1>
                <p>(See rule 5)</p>
                <h2>BIRTH REPORT</h2>
            </div>

            <form name="birthFormFull" ng-submit="submitAndPrintForm()">
                <div class="form-columns">
                    <!-- Legal Information Column -->
                    <div class="form-column-left border-end border-dark">
                        <div class="section-title-bar">
                            Legal Information <span style="float: right; font-weight: normal; font-size: 9px;">(To
                                be filled by the informant)</span>
                        </div>
                        <div class="section-content">
                            <!-- 1. Date of Birth -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">1.</span>Date of Birth
                                </div>
                                <div class="field-input-area char-box-container">
                                    <input type="text" id="L_dob_d1" class="char-box" maxlength="1"
                                        ng-model="formData.legal.dob.d1" ng-keyup="autoTab($event, 'L_dob_d2')"><input
                                        type="text" id="L_dob_d2" class="char-box" maxlength="1"
                                        ng-model="formData.legal.dob.d2" ng-keyup="autoTab($event, 'L_dob_m1')"
                                        ng-keydown="handleBackspace($event, 'L_dob_d1')"><span
                                        class="char-sep">-</span><input type="text" id="L_dob_m1" class="char-box"
                                        maxlength="1" ng-model="formData.legal.dob.m1"
                                        ng-keyup="autoTab($event, 'L_dob_m2')"
                                        ng-keydown="handleBackspace($event, 'L_dob_d2')"><input type="text"
                                        id="L_dob_m2" class="char-box" maxlength="1" ng-model="formData.legal.dob.m2"
                                        ng-keyup="autoTab($event, 'L_dob_y1')"
                                        ng-keydown="handleBackspace($event, 'L_dob_m1')"><span
                                        class="char-sep">-</span><input type="text" id="L_dob_y1" class="char-box"
                                        maxlength="1" ng-model="formData.legal.dob.y1"
                                        ng-keyup="autoTab($event, 'L_dob_y2')"
                                        ng-keydown="handleBackspace($event, 'L_dob_m2')"><input type="text"
                                        id="L_dob_y2" class="char-box" maxlength="1" ng-model="formData.legal.dob.y2"
                                        ng-keyup="autoTab($event, 'L_dob_y3')"
                                        ng-keydown="handleBackspace($event, 'L_dob_y1')"><input type="text"
                                        id="L_dob_y3" class="char-box" maxlength="1" ng-model="formData.legal.dob.y3"
                                        ng-keyup="autoTab($event, 'L_dob_y4')"
                                        ng-keydown="handleBackspace($event, 'L_dob_y2')"><input type="text"
                                        id="L_dob_y4" class="char-box" maxlength="1" ng-model="formData.legal.dob.y4"
                                        ng-keydown="handleBackspace($event, 'L_dob_y3')"
                                        ng-keyup="autoTab($event, 'L_sexMale')">
                                </div>
                            </div>

                            <!-- 2. Sex -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">2.</span>Sex
                                </div>
                                <div class="field-input-area">
                                    <div class="form-check form-check-inline p-0 me-2">
                                        <input class="form-check-input ms-0" type="radio" name="L_sex" id="L_sexMale"
                                            ng-model="formData.legal.sex" value="Male"
                                            ng-keyup="autoTab($event, 'L_child_name_first')"><label
                                            class="form-check-label" for="L_sexMale">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline p-0 me-2">
                                        <input class="form-check-input ms-0" type="radio" name="L_sex" id="L_sexFemale"
                                            ng-model="formData.legal.sex" value="Female"
                                            ng-keyup="autoTab($event, 'L_child_name_first')"><label
                                            class="form-check-label" for="L_sexFemale">Female</label>
                                    </div>
                                    <div class="form-check form-check-inline p-0">
                                        <input class="form-check-input ms-0" type="radio" name="L_sex" id="L_sexTrans"
                                            ng-model="formData.legal.sex" value="Transgender"
                                            ng-keyup="autoTab($event, 'L_child_name_first')"><label
                                            class="form-check-label" for="L_sexTrans">Transgender
                                            person</label>
                                    </div>
                                </div>
                            </div>

                            <!-- 3. Child's Details -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">3.</span>Child's Details
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="sub-field">
                                        <span class="sub-label">(a) Name, if any</span><input type="text"
                                            id="L_child_name_first" class="plain-input name-part" placeholder="First"
                                            ng-model="formData.legal.child.name.first"><input type="text"
                                            id="L_child_name_middle" class="plain-input name-part" placeholder="Middle"
                                            ng-model="formData.legal.child.name.middle"><input type="text"
                                            id="L_child_name_last" class="plain-input name-part" placeholder="Last"
                                            ng-model="formData.legal.child.name.last">
                                    </div>
                                    <span class="instruction-text ps-5 ms-5">(If not named,
                                        leave blank)</span>
                                    <div class="sub-field">
                                        <span class="sub-label">(b) Aadhaar No.</span>
                                        <div class="char-box-container">
                                            <input type="text" id="L_ca_c1" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c1"
                                                ng-keyup="autoTab($event, 'L_ca_c2')"
                                                ng-keydown="handleBackspace($event, 'L_child_name_last')"><input
                                                type="text" id="L_ca_c2" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c2"
                                                ng-keyup="autoTab($event, 'L_ca_c3')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c1')"><input type="text"
                                                id="L_ca_c3" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c3"
                                                ng-keyup="autoTab($event, 'L_ca_c4')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c2')"><input type="text"
                                                id="L_ca_c4" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c4"
                                                ng-keyup="autoTab($event, 'L_ca_c5')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c3')"><span
                                                class="char-sep"></span><input type="text" id="L_ca_c5" class="char-box"
                                                maxlength="1" ng-model="formData.legal.child.aadhaar.c5"
                                                ng-keyup="autoTab($event, 'L_ca_c6')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c4')"><input type="text"
                                                id="L_ca_c6" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c6"
                                                ng-keyup="autoTab($event, 'L_ca_c7')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c5')"><input type="text"
                                                id="L_ca_c7" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c7"
                                                ng-keyup="autoTab($event, 'L_ca_c8')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c6')"><input type="text"
                                                id="L_ca_c8" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c8"
                                                ng-keyup="autoTab($event, 'L_ca_c9')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c7')"><span
                                                class="char-sep"></span><input type="text" id="L_ca_c9" class="char-box"
                                                maxlength="1" ng-model="formData.legal.child.aadhaar.c9"
                                                ng-keyup="autoTab($event, 'L_ca_c10')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c8')"><input type="text"
                                                id="L_ca_c10" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c10"
                                                ng-keyup="autoTab($event, 'L_ca_c11')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c9')"><input type="text"
                                                id="L_ca_c11" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c11"
                                                ng-keyup="autoTab($event, 'L_ca_c12')"
                                                ng-keydown="handleBackspace($event, 'L_ca_c10')"><input type="text"
                                                id="L_ca_c12" class="char-box" maxlength="1"
                                                ng-model="formData.legal.child.aadhaar.c12"
                                                ng-keydown="handleBackspace($event, 'L_ca_c11')"
                                                ng-keyup="autoTab($event, 'L_father_name_first')">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 4. Father's Details -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">4.</span>Father's Details
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="sub-field">
                                        <span class="sub-label">(a) Name</span><input type="text"
                                            id="L_father_name_first" class="plain-input name-part"
                                            ng-model="formData.legal.father.name.first" placeholder="First"><input
                                            type="text" id="L_father_name_middle" class="plain-input name-part"
                                            ng-model="formData.legal.father.name.middle" placeholder="Middle"><input
                                            type="text" id="L_father_name_last" class="plain-input name-part"
                                            ng-model="formData.legal.father.name.last" placeholder="Last">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(b) Aadhaar No.</span>
                                        <div class="char-box-container">
                                            <input type="text" id="L_fa_c1" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c1"
                                                ng-keyup="autoTab($event, 'L_fa_c2')"
                                                ng-keydown="handleBackspace($event, 'L_father_name_last')"><input
                                                type="text" id="L_fa_c2" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c2"
                                                ng-keyup="autoTab($event, 'L_fa_c3')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c1')"><input type="text"
                                                id="L_fa_c3" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c3"
                                                ng-keyup="autoTab($event, 'L_fa_c4')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c2')"><input type="text"
                                                id="L_fa_c4" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c4"
                                                ng-keyup="autoTab($event, 'L_fa_c5')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c3')"><span
                                                class="char-sep"></span><input type="text" id="L_fa_c5" class="char-box"
                                                maxlength="1" ng-model="formData.legal.father.aadhaar.c5"
                                                ng-keyup="autoTab($event, 'L_fa_c6')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c4')"><input type="text"
                                                id="L_fa_c6" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c6"
                                                ng-keyup="autoTab($event, 'L_fa_c7')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c5')"><input type="text"
                                                id="L_fa_c7" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c7"
                                                ng-keyup="autoTab($event, 'L_fa_c8')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c6')"><input type="text"
                                                id="L_fa_c8" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c8"
                                                ng-keyup="autoTab($event, 'L_fa_c9')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c7')"><span
                                                class="char-sep"></span><input type="text" id="L_fa_c9" class="char-box"
                                                maxlength="1" ng-model="formData.legal.father.aadhaar.c9"
                                                ng-keyup="autoTab($event, 'L_fa_c10')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c8')"><input type="text"
                                                id="L_fa_c10" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c10"
                                                ng-keyup="autoTab($event, 'L_fa_c11')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c9')"><input type="text"
                                                id="L_fa_c11" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c11"
                                                ng-keyup="autoTab($event, 'L_fa_c12')"
                                                ng-keydown="handleBackspace($event, 'L_fa_c10')"><input type="text"
                                                id="L_fa_c12" class="char-box" maxlength="1"
                                                ng-model="formData.legal.father.aadhaar.c12"
                                                ng-keydown="handleBackspace($event, 'L_fa_c11')"
                                                ng-keyup="autoTab($event, 'L_father_mobile')">
                                        </div>
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(c) Mobile No.</span><input type="text"
                                            id="L_father_mobile" class="plain-input short"
                                            ng-model="formData.legal.father.mobile">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(d) Email Id</span><input type="email"
                                            id="L_father_email" class="plain-input medium"
                                            ng-model="formData.legal.father.email">
                                    </div>
                                </div>
                            </div>
                            <!-- 5. Mother's Details -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">5.</span>Mother's Details
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="sub-field">
                                        <span class="sub-label">(a) Name</span><input type="text"
                                            id="L_mother_name_first" class="plain-input name-part"
                                            ng-model="formData.legal.mother.name.first" placeholder="First"><input
                                            type="text" id="L_mother_name_middle" class="plain-input name-part"
                                            ng-model="formData.legal.mother.name.middle" placeholder="Middle"><input
                                            type="text" id="L_mother_name_last" class="plain-input name-part"
                                            ng-model="formData.legal.mother.name.last" placeholder="Last">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(b) Aadhaar No.</span>
                                        <div class="char-box-container">
                                            <input type="text" id="L_ma_c1" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c1"
                                                ng-keyup="autoTab($event, 'L_ma_c2')"
                                                ng-keydown="handleBackspace($event, 'L_mother_name_last')"><input
                                                type="text" id="L_ma_c2" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c2"
                                                ng-keyup="autoTab($event, 'L_ma_c3')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c1')"><input type="text"
                                                id="L_ma_c3" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c3"
                                                ng-keyup="autoTab($event, 'L_ma_c4')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c2')"><input type="text"
                                                id="L_ma_c4" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c4"
                                                ng-keyup="autoTab($event, 'L_ma_c5')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c3')"><span
                                                class="char-sep"></span><input type="text" id="L_ma_c5" class="char-box"
                                                maxlength="1" ng-model="formData.legal.mother.aadhaar.c5"
                                                ng-keyup="autoTab($event, 'L_ma_c6')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c4')"><input type="text"
                                                id="L_ma_c6" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c6"
                                                ng-keyup="autoTab($event, 'L_ma_c7')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c5')"><input type="text"
                                                id="L_ma_c7" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c7"
                                                ng-keyup="autoTab($event, 'L_ma_c8')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c6')"><input type="text"
                                                id="L_ma_c8" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c8"
                                                ng-keyup="autoTab($event, 'L_ma_c9')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c7')"><span
                                                class="char-sep"></span><input type="text" id="L_ma_c9" class="char-box"
                                                maxlength="1" ng-model="formData.legal.mother.aadhaar.c9"
                                                ng-keyup="autoTab($event, 'L_ma_c10')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c8')"><input type="text"
                                                id="L_ma_c10" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c10"
                                                ng-keyup="autoTab($event, 'L_ma_c11')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c9')"><input type="text"
                                                id="L_ma_c11" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c11"
                                                ng-keyup="autoTab($event, 'L_ma_c12')"
                                                ng-keydown="handleBackspace($event, 'L_ma_c10')"><input type="text"
                                                id="L_ma_c12" class="char-box" maxlength="1"
                                                ng-model="formData.legal.mother.aadhaar.c12"
                                                ng-keydown="handleBackspace($event, 'L_ma_c11')"
                                                ng-keyup="autoTab($event, 'L_mother_mobile')">
                                        </div>
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(c) Mobile No.</span><input type="text"
                                            id="L_mother_mobile" class="plain-input short"
                                            ng-model="formData.legal.mother.mobile">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(d) Email Id</span><input type="email"
                                            id="L_mother_email" class="plain-input medium"
                                            ng-model="formData.legal.mother.email">
                                    </div>
                                </div>
                            </div>

                            <!-- 6. Address of parents at the time of Birth of the Child -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">6.</span>Address of parents at time
                                    of Birth
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="form-columns">
                                        <!-- Left Column -->
                                        <div class="form-column-left">
                                            <input type="text" id="L_ba_houseNo" class="plain-input"
                                                placeholder="House No:" ng-model="formData.legal.birthAddress.houseNo">
                                            <input type="text" id="L_ba_locality" class="plain-input"
                                                placeholder="Locality:" ng-model="formData.legal.birthAddress.locality">
                                            <input type="text" id="L_ba_wardNo" class="plain-input"
                                                placeholder="Ward number:"
                                                ng-model="formData.legal.birthAddress.wardNo"> <input type="text"
                                                id="L_ba_townVillage" class="plain-input" placeholder="Town or Village:"
                                                ng-model="formData.legal.birthAddress.townVillage">
                                        </div>

                                        <!-- Right Column -->
                                        <div class="form-column-right">
                                            <input type="text" id="L_ba_subDistrict" class="plain-input"
                                                placeholder="Sub-district:"
                                                ng-model="formData.legal.birthAddress.subDistrict"> <input type="text"
                                                id="L_ba_district" class="plain-input" placeholder="District:"
                                                ng-model="formData.legal.birthAddress.district">

                                            <div class="sub-field">
                                                <span class="sub-label" style="min-width: 60px;">PIN
                                                    Code:</span>
                                                <div class="char-box-container">
                                                    <input type="text" id="L_ba_pin_c1" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.birthAddress.pin.c1"
                                                        ng-keyup="autoTab($event, 'L_ba_pin_c2')"
                                                        ng-keydown="handleBackspace($event, 'L_ba_district')">
                                                    <input type="text" id="L_ba_pin_c2" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.birthAddress.pin.c2"
                                                        ng-keyup="autoTab($event, 'L_ba_pin_c3')"
                                                        ng-keydown="handleBackspace($event, 'L_ba_pin_c1')">
                                                    <input type="text" id="L_ba_pin_c3" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.birthAddress.pin.c3"
                                                        ng-keyup="autoTab($event, 'L_ba_pin_c4')"
                                                        ng-keydown="handleBackspace($event, 'L_ba_pin_c2')">
                                                    <input type="text" id="L_ba_pin_c4" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.birthAddress.pin.c4"
                                                        ng-keyup="autoTab($event, 'L_ba_pin_c5')"
                                                        ng-keydown="handleBackspace($event, 'L_ba_pin_c3')">
                                                    <input type="text" id="L_ba_pin_c5" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.birthAddress.pin.c5"
                                                        ng-keyup="autoTab($event, 'L_ba_pin_c6')"
                                                        ng-keydown="handleBackspace($event, 'L_ba_pin_c4')">
                                                    <input type="text" id="L_ba_pin_c6" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.birthAddress.pin.c6"
                                                        ng-keydown="handleBackspace($event, 'L_ba_pin_c5')"
                                                        ng-keyup="autoTab($event, 'L_ba_state')">
                                                </div>
                                            </div>

                                            <input type="text" id="L_ba_state" class="plain-input"
                                                placeholder="State or Union Territory:"
                                                ng-model="formData.legal.birthAddress.state">
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- 7. Permanent address of parents -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">7.</span>Permanent address of parents
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="form-check p-0 mb-1">
                                        <input class="form-check-input ms-0" type="checkbox" id="L_sameAsBirthAddress"
                                            ng-model="formData.legal.isPermAddressSame"
                                            ng-change="togglePermanentAddress()"> <label class="form-check-label"
                                            for="L_sameAsBirthAddress">
                                            Same as address at time of birth </label>
                                    </div>
                                    <div id="L_permanentAddressSectionExact" ng-if="!formData.legal.isPermAddressSame">
                                        <div class="form-columns">
                                            <div class="form-column-left">
                                                <input type="text" class="plain-input" placeholder="House No:"
                                                    ng-model="formData.legal.permAddress.houseNo"> <input type="text"
                                                    class="plain-input" placeholder="Locality:"
                                                    ng-model="formData.legal.permAddress.locality"> <input type="text"
                                                    class="plain-input" placeholder="Ward number:"
                                                    ng-model="formData.legal.permAddress.wardNo"> <input type="text"
                                                    class="plain-input" placeholder="Town or Village:"
                                                    ng-model="formData.legal.permAddress.townVillage">
                                            </div>
                                            <div class="form-column-right">
                                                <input type="text" class="plain-input" placeholder="Sub-district:"
                                                    ng-model="formData.legal.permAddress.subDistrict"> <input
                                                    type="text" class="plain-input" placeholder="District:"
                                                    ng-model="formData.legal.permAddress.district">
                                                <div class="sub-field">
                                                    <span class="sub-label" style="min-width: 60px;">PIN
                                                        Code:</span>
                                                    <div class="char-box-container">
                                                        <input type="text" class="char-box" maxlength="1"
                                                            ng-model="formData.legal.permAddress.pin.c1"
                                                            ng-keyup="autoTab($event, 'L_pa_pin_c2')"
                                                            ng-keydown="handleBackspace($event, 'L_pa_district')">
                                                        <input type="text" class="char-box" maxlength="1"
                                                            ng-model="formData.legal.permAddress.pin.c2"
                                                            ng-keyup="autoTab($event, 'L_pa_pin_c3')"
                                                            ng-keydown="handleBackspace($event, 'L_pa_pin_c1')">
                                                        <input type="text" class="char-box" maxlength="1"
                                                            ng-model="formData.legal.permAddress.pin.c3"
                                                            ng-keyup="autoTab($event, 'L_pa_pin_c4')"
                                                            ng-keydown="handleBackspace($event, 'L_pa_pin_c2')">
                                                        <input type="text" class="char-box" maxlength="1"
                                                            ng-model="formData.legal.permAddress.pin.c4"
                                                            ng-keyup="autoTab($event, 'L_pa_pin_c5')"
                                                            ng-keydown="handleBackspace($event, 'L_pa_pin_c3')">
                                                        <input type="text" class="char-box" maxlength="1"
                                                            ng-model="formData.legal.permAddress.pin.c5"
                                                            ng-keyup="autoTab($event, 'L_pa_pin_c6')"
                                                            ng-keydown="handleBackspace($event, 'L_pa_pin_c4')">
                                                        <input type="text" class="char-box" maxlength="1"
                                                            ng-model="formData.legal.permAddress.pin.c6"
                                                            ng-keyup="autoTab($event, 'L_pa_state')"
                                                            ng-keydown="handleBackspace($event, 'L_pa_pin_c5')">
                                                    </div>
                                                </div>
                                                <input type="text" id="L_pa_state" class="plain-input"
                                                    placeholder="State or Union Territory:"
                                                    ng-model="formData.legal.permAddress.state">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- 8. Place of birth -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">8.</span>Place of birth 
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="L_pobType"
                                            id="L_pobHosp" ng-model="formData.legal.pob.type" value="Hospital"
                                            ng-change="togglePobDetails()"><label class="form-check-label"
                                            for="L_pobHosp">1. Hospital /
                                            Institution</label> <input type="text" id="L_pobName"
                                            class="plain-input inline-short" placeholder="Name:"
                                            ng-model="formData.legal.pob.name"
                                            ng-if="formData.legal.pob.type === 'Hospital'">
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="L_pobType"
                                            id="L_pobHouse" ng-model="formData.legal.pob.type" value="House"
                                            ng-change="togglePobDetails()"><label class="form-check-label"
                                            for="L_pobHouse">2. House</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="L_pobType"
                                            id="L_pobOther" ng-model="formData.legal.pob.type" value="Other"
                                            ng-change="togglePobDetails()"><label class="form-check-label"
                                            for="L_pobOther">3. Other
                                            place</label> <input type="text" id="L_pobOtherSpecify"
                                            class="plain-input inline-short" placeholder="Specify:"
                                            ng-model="formData.legal.pob.otherSpecify"
                                            ng-if="formData.legal.pob.type === 'Other'">
                                    </div>
                                    <div class="mt-1" id="L_pobAddressSectionExact"
                                        ng-if="formData.legal.pob.type === 'Hospital' || formData.legal.pob.type === 'House'">
                                        <span class="sub-label d-block ps-0">Address:</span> 
                                        
                                      <div class="form-columns">
                                        <!-- Left Column -->
                                        <div class="form-column-left">
                                        <input type="text"
                                            id="L_poba_houseNo" class="plain-input" placeholder="House No:"
                                            ng-model="formData.legal.pob.address.houseNo">
                                        <input type="text"
                                            id="L_poba_locality" class="plain-input" placeholder="Locality:"
                                            ng-model="formData.legal.pob.address.locality">
                                        <input type="text"
                                            id="L_poba_wardNo" class="plain-input" placeholder="Ward number:"
                                            ng-model="formData.legal.pob.address.wardNo"> 
                                        <input type="text"
                                            id="L_poba_townVillage" class="plain-input" placeholder="Town or Village:"
                                            ng-model="formData.legal.pob.address.townVillage"> 
                                            
                                            </div>
                                             <div class="form-column-right">
                                        <input type="text"
                                            id="L_poba_subDistrict" class="plain-input" placeholder="Sub-district:"
                                            ng-model="formData.legal.pob.address.subDistrict"> 
                                        <input type="text"
                                            id="L_poba_district" class="plain-input" placeholder="District:"
                                            ng-model="formData.legal.pob.address.district">
                                        <div class="sub-field">
                                            <span class="sub-label" style="min-width: 60px;">PIN
                                                Code:</span>
                                            <div class="char-box-container">
                                                <input type="text" id="L_poba_pin_c1" class="char-box" maxlength="1"
                                                    ng-model="formData.legal.pob.address.pin.c1"
                                                    ng-keyup="autoTab($event, 'L_poba_pin_c2')"
                                                    ng-keydown="handleBackspace($event, 'L_poba_district')"><input
                                                    type="text" id="L_poba_pin_c2" class="char-box" maxlength="1"
                                                    ng-model="formData.legal.pob.address.pin.c2"
                                                    ng-keyup="autoTab($event, 'L_poba_pin_c3')"
                                                    ng-keydown="handleBackspace($event, 'L_poba_pin_c1')"><input
                                                    type="text" id="L_poba_pin_c3" class="char-box" maxlength="1"
                                                    ng-model="formData.legal.pob.address.pin.c3"
                                                    ng-keyup="autoTab($event, 'L_poba_pin_c4')"
                                                    ng-keydown="handleBackspace($event, 'L_poba_pin_c2')"><input
                                                    type="text" id="L_poba_pin_c4" class="char-box" maxlength="1"
                                                    ng-model="formData.legal.pob.address.pin.c4"
                                                    ng-keyup="autoTab($event, 'L_poba_pin_c5')"
                                                    ng-keydown="handleBackspace($event, 'L_poba_pin_c3')"><input
                                                    type="text" id="L_poba_pin_c5" class="char-box" maxlength="1"
                                                    ng-model="formData.legal.pob.address.pin.c5"
                                                    ng-keyup="autoTab($event, 'L_poba_pin_c6')"
                                                    ng-keydown="handleBackspace($event, 'L_poba_pin_c4')"><input
                                                    type="text" id="L_poba_pin_c6" class="char-box" maxlength="1"
                                                    ng-model="formData.legal.pob.address.pin.c6"
                                                    ng-keydown="handleBackspace($event, 'L_poba_pin_c5')"
                                                    ng-keyup="autoTab($event, 'L_poba_state')">
                                            </div>
                                        </div>
                                        <input type="text" id="L_poba_state" class="plain-input"
                                            placeholder="State or Union Territory:"
                                            ng-model="formData.legal.pob.address.state">
                                            </div>
                                </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 9. Informant's Details -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">9.</span>Informant's Details
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="sub-field">
                                        <span class="sub-label">(a) Name</span><input type="text"
                                            id="L_informant_name_first" class="plain-input name-part"
                                            ng-model="formData.legal.informant.name.first" placeholder="First"><input
                                            type="text" id="L_informant_name_middle" class="plain-input name-part"
                                            ng-model="formData.legal.informant.name.middle" placeholder="Middle"><input
                                            type="text" id="L_informant_name_last" class="plain-input name-part"
                                            ng-model="formData.legal.informant.name.last" placeholder="Last">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(b) Aadhaar No.</span>
                                        <div class="char-box-container">
                                            <input type="text" id="L_ia_c1" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c1"
                                                ng-keyup="autoTab($event, 'L_ia_c2')"
                                                ng-keydown="handleBackspace($event, 'L_informant_name_last')"><input
                                                type="text" id="L_ia_c2" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c2"
                                                ng-keyup="autoTab($event, 'L_ia_c3')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c1')"><input type="text"
                                                id="L_ia_c3" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c3"
                                                ng-keyup="autoTab($event, 'L_ia_c4')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c2')"><input type="text"
                                                id="L_ia_c4" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c4"
                                                ng-keyup="autoTab($event, 'L_ia_c5')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c3')"><span
                                                class="char-sep"></span><input type="text" id="L_ia_c5" class="char-box"
                                                maxlength="1" ng-model="formData.legal.informant.aadhaar.c5"
                                                ng-keyup="autoTab($event, 'L_ia_c6')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c4')"><input type="text"
                                                id="L_ia_c6" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c6"
                                                ng-keyup="autoTab($event, 'L_ia_c7')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c5')"><input type="text"
                                                id="L_ia_c7" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c7"
                                                ng-keyup="autoTab($event, 'L_ia_c8')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c6')"><input type="text"
                                                id="L_ia_c8" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c8"
                                                ng-keyup="autoTab($event, 'L_ia_c9')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c7')"><span
                                                class="char-sep"></span><input type="text" id="L_ia_c9" class="char-box"
                                                maxlength="1" ng-model="formData.legal.informant.aadhaar.c9"
                                                ng-keyup="autoTab($event, 'L_ia_c10')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c8')"><input type="text"
                                                id="L_ia_c10" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c10"
                                                ng-keyup="autoTab($event, 'L_ia_c11')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c9')"><input type="text"
                                                id="L_ia_c11" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c11"
                                                ng-keyup="autoTab($event, 'L_ia_c12')"
                                                ng-keydown="handleBackspace($event, 'L_ia_c10')"><input type="text"
                                                id="L_ia_c12" class="char-box" maxlength="1"
                                                ng-model="formData.legal.informant.aadhaar.c12"
                                                ng-keydown="handleBackspace($event, 'L_ia_c11')"
                                                ng-keyup="autoTab($event, 'L_informant_mobile')">
                                        </div>
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(c) Mobile No.</span><input type="text"
                                            id="L_informant_mobile" class="plain-input short"
                                            ng-model="formData.legal.informant.mobile">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(d) Email Id</span><input type="email"
                                            id="L_informant_email" class="plain-input medium"
                                            ng-model="formData.legal.informant.email">
                                    </div>
                                    <div class="sub-field mt-1">
                                        <span class="sub-label">(e) Address:</span> <span class="instruction-text">(Full
                                            address)</span>
                                    </div>
                                    <div class="form-columns">
                                        <div class="form-column-left">
                                            <input type="text" id="L_iaa_houseNo" class="plain-input"
                                                placeholder="House No:"
                                                ng-model="formData.legal.informant.address.houseNo">
                                            <input type="text" id="L_iaa_locality" class="plain-input"
                                                placeholder="Locality:"
                                                ng-model="formData.legal.informant.address.locality">
                                            <input type="text" id="L_iaa_wardNo" class="plain-input"
                                                placeholder="Ward number:"
                                                ng-model="formData.legal.informant.address.wardNo"> <input type="text"
                                                id="L_iaa_townVillage" class="plain-input"
                                                placeholder="Town or Village:"
                                                ng-model="formData.legal.informant.address.townVillage">
                                        </div>
                                        <div class="form-column-right">
                                            <input type="text" id="L_iaa_subDistrict" class="plain-input"
                                                placeholder="Sub-district:"
                                                ng-model="formData.legal.informant.address.subDistrict">
                                            <input type="text" id="L_iaa_district" class="plain-input"
                                                placeholder="District:"
                                                ng-model="formData.legal.informant.address.district">
                                            <div class="sub-field">
                                                <span class="sub-label" style="min-width: 60px;">PIN
                                                    Code:</span>
                                                <div class="char-box-container">
                                                    <input type="text" id="L_iaa_pin_c1" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.informant.address.pin.c1"
                                                        ng-keyup="autoTab($event, 'L_iaa_pin_c2')"
                                                        ng-keydown="handleBackspace($event, 'L_iaa_district')"><input
                                                        type="text" id="L_iaa_pin_c2" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.informant.address.pin.c2"
                                                        ng-keyup="autoTab($event, 'L_iaa_pin_c3')"
                                                        ng-keydown="handleBackspace($event, 'L_iaa_pin_c1')"><input
                                                        type="text" id="L_iaa_pin_c3" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.informant.address.pin.c3"
                                                        ng-keyup="autoTab($event, 'L_iaa_pin_c4')"
                                                        ng-keydown="handleBackspace($event, 'L_iaa_pin_c2')"><input
                                                        type="text" id="L_iaa_pin_c4" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.informant.address.pin.c4"
                                                        ng-keyup="autoTab($event, 'L_iaa_pin_c5')"
                                                        ng-keydown="handleBackspace($event, 'L_iaa_pin_c3')"><input
                                                        type="text" id="L_iaa_pin_c5" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.informant.address.pin.c5"
                                                        ng-keyup="autoTab($event, 'L_iaa_pin_c6')"
                                                        ng-keydown="handleBackspace($event, 'L_iaa_pin_c4')"><input
                                                        type="text" id="L_iaa_pin_c6" class="char-box" maxlength="1"
                                                        ng-model="formData.legal.informant.address.pin.c6"
                                                        ng-keydown="handleBackspace($event, 'L_iaa_pin_c5')"
                                                        ng-keyup="autoTab($event, 'L_iaa_state')">
                                                </div>
                                            </div>
                                            <input type="text" id="L_iaa_state" class="plain-input"
                                                placeholder="State or Union Territory:"
                                                ng-model="formData.legal.informant.address.state">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- DECLARATION -->
                            <div class="field-group"
                                style="flex-direction: column; align-items: flex-start; border-bottom: none;">
                                <div class="field-label" style="font-weight: bold; min-width: auto;">DECLARATION</div>
                                <div class="declaration-text">
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="checkbox"
                                            id="L_declarationCheckExact"
                                            ng-model="formData.legal.declarationAccepted"><label
                                            class="form-check-label" for="L_declarationCheckExact">I
                                            have furnished true information to the best of my knowledge
                                            and belief. I am aware of the penalties under section 23 of
                                            the Registration of Births and Deaths Act, 1969 (amended in
                                            2023) for submitting false information. Also, I give consent,
                                            under Aadhaar (Targeted Delivery of Financial and Other
                                            Subsidies, Benefits and Services) Act, 2016, for
                                            authenticating identity by way of Aadhaar authentication.</label>
                                    </div>
                                </div>
                            </div>
                            <p class="instruction-text mt-1">(After completing all columns
                                1 to 22, informant will put date and signature)</p>
                            <div class="row mt-1 gx-2">
                                <div class="col-5">
                                    <span class="sub-label">Date:</span>
                                    <div class="char-box-container d-inline-flex">
                                        <input type="text" id="L_isd_d1" class="char-box" maxlength="1"
                                            ng-model="formData.legal.informantSignDate.d1"
                                            ng-keyup="autoTab($event, 'L_isd_d2')"
                                            ng-keydown="handleBackspace($event, 'L_declarationCheckExact')"><input
                                            type="text" id="L_isd_d2" class="char-box" maxlength="1"
                                            ng-model="formData.legal.informantSignDate.d2"
                                            ng-keyup="autoTab($event, 'L_isd_m1')"
                                            ng-keydown="handleBackspace($event, 'L_isd_d1')"><span
                                            class="char-sep">-</span><input type="text" id="L_isd_m1" class="char-box"
                                            maxlength="1" ng-model="formData.legal.informantSignDate.m1"
                                            ng-keyup="autoTab($event, 'L_isd_m2')"
                                            ng-keydown="handleBackspace($event, 'L_isd_d2')"><input type="text"
                                            id="L_isd_m2" class="char-box" maxlength="1"
                                            ng-model="formData.legal.informantSignDate.m2"
                                            ng-keyup="autoTab($event, 'L_isd_y1')"
                                            ng-keydown="handleBackspace($event, 'L_isd_m1')"><span
                                            class="char-sep">-</span><input type="text" id="L_isd_y1" class="char-box"
                                            maxlength="1" ng-model="formData.legal.informantSignDate.y1"
                                            ng-keyup="autoTab($event, 'L_isd_y2')"
                                            ng-keydown="handleBackspace($event, 'L_isd_m2')"><input type="text"
                                            id="L_isd_y2" class="char-box" maxlength="1"
                                            ng-model="formData.legal.informantSignDate.y2"
                                            ng-keyup="autoTab($event, 'L_isd_y3')"
                                            ng-keydown="handleBackspace($event, 'L_isd_y1')"><input type="text"
                                            id="L_isd_y3" class="char-box" maxlength="1"
                                            ng-model="formData.legal.informantSignDate.y3"
                                            ng-keyup="autoTab($event, 'L_isd_y4')"
                                            ng-keydown="handleBackspace($event, 'L_isd_y2')"><input type="text"
                                            id="L_isd_y4" class="char-box" maxlength="1"
                                            ng-model="formData.legal.informantSignDate.y4"
                                            ng-keydown="handleBackspace($event, 'L_isd_y3')">
                                    </div>
                                </div>
                                <div class="col-7">
                                    <div class="signature-line" title="Informant Signature Area"></div>
                                    <div class="signature-label">Signature or left thumb mark
                                        of the informant</div>
                                </div>
                            </div>

                            <!-- Registrar Fill Area (Legal) -->
                            <div class="registrar-fill-area">
                                <div style="text-align: center; font-weight: bold; margin-bottom: 5px;">To
                                    be filled by the Registrar</div>
                                <div class="field-group">
                                    <div class="field-label">Registration No.:</div>
                                    <div class="field-input-area">
                                        <input type="text" id="L_reg_regNo" class="plain-input"
                                            ng-model="formData.legal.registrar.regNo">
                                    </div>
                                </div>
                                <div class="field-group">
                                    <div class="field-label">Registration Date:</div>
                                    <div class="field-input-area char-box-container">
                                        <input type="text" id="L_regd_d1" class="char-box" maxlength="1"
                                            ng-model="formData.legal.registrar.regDate.d1"
                                            ng-keyup="autoTab($event, 'L_regd_d2')"
                                            ng-keydown="handleBackspace($event, 'L_reg_regNo')"><input type="text"
                                            id="L_regd_d2" class="char-box" maxlength="1"
                                            ng-model="formData.legal.registrar.regDate.d2"
                                            ng-keyup="autoTab($event, 'L_regd_m1')"
                                            ng-keydown="handleBackspace($event, 'L_regd_d1')"><span
                                            class="char-sep">-</span><input type="text" id="L_regd_m1" class="char-box"
                                            maxlength="1" ng-model="formData.legal.registrar.regDate.m1"
                                            ng-keyup="autoTab($event, 'L_regd_m2')"
                                            ng-keydown="handleBackspace($event, 'L_regd_d2')"><input type="text"
                                            id="L_regd_m2" class="char-box" maxlength="1"
                                            ng-model="formData.legal.registrar.regDate.m2"
                                            ng-keyup="autoTab($event, 'L_regd_y1')"
                                            ng-keydown="handleBackspace($event, 'L_regd_m1')"><span
                                            class="char-sep">-</span><input type="text" id="L_regd_y1" class="char-box"
                                            maxlength="1" ng-model="formData.legal.registrar.regDate.y1"
                                            ng-keyup="autoTab($event, 'L_regd_y2')"
                                            ng-keydown="handleBackspace($event, 'L_regd_m2')"><input type="text"
                                            id="L_regd_y2" class="char-box" maxlength="1"
                                            ng-model="formData.legal.registrar.regDate.y2"
                                            ng-keyup="autoTab($event, 'L_regd_y3')"
                                            ng-keydown="handleBackspace($event, 'L_regd_y1')"><input type="text"
                                            id="L_regd_y3" class="char-box" maxlength="1"
                                            ng-model="formData.legal.registrar.regDate.y3"
                                            ng-keyup="autoTab($event, 'L_regd_y4')"
                                            ng-keydown="handleBackspace($event, 'L_regd_y2')"><input type="text"
                                            id="L_regd_y4" class="char-box" maxlength="1"
                                            ng-model="formData.legal.registrar.regDate.y4"
                                            ng-keydown="handleBackspace($event, 'L_regd_y3')"
                                            ng-keyup="autoTab($event, 'L_reg_regUnit')">
                                    </div>
                                </div>
                                <div class="field-group">
                                    <div class="field-label">Registration Unit:</div>
                                    <div class="field-input-area">
                                        <input type="text" id="L_reg_regUnit" class="plain-input"
                                            ng-model="formData.legal.registrar.regUnit">
                                    </div>
                                </div>
                                <div class="field-group">
                                    <div class="field-label">Town / Village:</div>
                                    <div class="field-input-area">
                                        <input type="text" id="L_reg_townVillage" class="plain-input"
                                            ng-model="formData.legal.registrar.townVillage">
                                    </div>
                                </div>
                                <div class="field-group">
                                    <div class="field-label">Sub-District:</div>
                                    <div class="field-input-area">
                                        <input type="text" id="L_reg_subDistrict" class="plain-input"
                                            ng-model="formData.legal.registrar.subDistrict">
                                    </div>
                                </div>
                                <div class="field-group">
                                    <div class="field-label">District:</div>
                                    <div class="field-input-area">
                                        <input type="text" id="L_reg_district" class="plain-input"
                                            ng-model="formData.legal.registrar.district">
                                    </div>
                                </div>
                                <div class="field-group">
                                    <div class="field-label">Remarks (if any):</div>
                                    <div class="field-input-area">
                                        <textarea id="L_reg_remarks" class="plain-input" rows="1"
                                            ng-model="formData.legal.registrar.remarks"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Statistical Information Column -->
                    <div class="form-column-right">
                        <div class="section-title-bar">
                            Statistical Information <span
                                style="float: right; font-weight: normal; font-size: 9px;">(SEE
                                REVERSE FOR INSTRUCTIONS)</span>
                        </div>
                        <div class="statistical-note">This part to be detached and
                            sent for statistical processing.</div>
                        <div class="section-content">
                            <!-- 10. Town or Village of Residence of the mother -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">10.</span>Town or Village of
                                    Residence of mother <span class="instruction-text">(Place
                                        where mother usually lives...)</span>
                                </div>
                                <div class="field-input-area column-layout">
                                    <div>
                                        <div class="form-check form-check-inline p-0">
                                            <input class="form-check-input ms-0" type="radio" name="S_motherResType"
                                                id="S_mr_typeTown" ng-model="formData.statistical.motherResidence.type"
                                                value="Town"><label class="form-check-label"
                                                for="S_mr_typeTown">Town</label>
                                        </div>
                                        <div class="form-check form-check-inline p-0">
                                            <input class="form-check-input ms-0" type="radio" name="S_motherResType"
                                                id="S_mr_typeVillage"
                                                ng-model="formData.statistical.motherResidence.type"
                                                value="Village"><label class="form-check-label"
                                                for="S_mr_typeVillage">Village</label>
                                        </div>
                                        <input type="text" id="S_mr_name" class="plain-input inline-short"
                                            placeholder="Name:" ng-model="formData.statistical.motherResidence.name">
                                    </div>
                                    <input type="text" id="S_mr_subDistrict" class="plain-input"
                                        placeholder="Sub-district:"
                                        ng-model="formData.statistical.motherResidence.address.subDistrict">
                                    <input type="text" id="S_mr_district" class="plain-input" placeholder="District:"
                                        ng-model="formData.statistical.motherResidence.address.district">
                                    <div class="sub-field">
                                        <span class="sub-label" style="min-width: 60px;">PIN
                                            Code:</span>
                                        <div class="char-box-container">
                                            <input type="text" id="S_mr_pin_c1" class="char-box" maxlength="1"
                                                ng-model="formData.statistical.motherResidence.address.pin.c1"
                                                ng-keyup="autoTab($event, 'S_mr_pin_c2')"
                                                ng-keydown="handleBackspace($event, 'S_mr_district')"><input type="text"
                                                id="S_mr_pin_c2" class="char-box" maxlength="1"
                                                ng-model="formData.statistical.motherResidence.address.pin.c2"
                                                ng-keyup="autoTab($event, 'S_mr_pin_c3')"
                                                ng-keydown="handleBackspace($event, 'S_mr_pin_c1')"><input type="text"
                                                id="S_mr_pin_c3" class="char-box" maxlength="1"
                                                ng-model="formData.statistical.motherResidence.address.pin.c3"
                                                ng-keyup="autoTab($event, 'S_mr_pin_c4')"
                                                ng-keydown="handleBackspace($event, 'S_mr_pin_c2')"><input type="text"
                                                id="S_mr_pin_c4" class="char-box" maxlength="1"
                                                ng-model="formData.statistical.motherResidence.address.pin.c4"
                                                ng-keyup="autoTab($event, 'S_mr_pin_c5')"
                                                ng-keydown="handleBackspace($event, 'S_mr_pin_c3')"><input type="text"
                                                id="S_mr_pin_c5" class="char-box" maxlength="1"
                                                ng-model="formData.statistical.motherResidence.address.pin.c5"
                                                ng-keyup="autoTab($event, 'S_mr_pin_c6')"
                                                ng-keydown="handleBackspace($event, 'S_mr_pin_c4')"><input type="text"
                                                id="S_mr_pin_c6" class="char-box" maxlength="1"
                                                ng-model="formData.statistical.motherResidence.address.pin.c6"
                                                ng-keydown="handleBackspace($event, 'S_mr_pin_c5')"
                                                ng-keyup="autoTab($event, 'S_mr_state')">
                                        </div>
                                    </div>
                                    <input type="text" id="S_mr_state" class="plain-input"
                                        placeholder="State or Union Territory:"
                                        ng-model="formData.statistical.motherResidence.address.state">
                                </div>
                            </div>
                            <!-- 11. For Religion -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">11.</span>For Religion <span
                                        class="instruction-text">(Enter "Hindu" etc.)</span>
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="sub-field">
                                        <span class="sub-label">(a) Religion of Father:</span><input type="text"
                                            id="S_religion_father" class="plain-input"
                                            ng-model="formData.statistical.religion.father">
                                    </div>
                                    <div class="sub-field">
                                        <span class="sub-label">(b) Religion of Mother:</span><input type="text"
                                            id="S_religion_mother" class="plain-input"
                                            ng-model="formData.statistical.religion.mother">
                                    </div>
                                </div>
                            </div>
                            <!-- 12. Father's level of education -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">12.</span>Father's level of
                                    education:
                                </div>
                                <div class="field-input-area">
                                    <input type="text" id="S_edu_father" class="plain-input"
                                        ng-model="formData.statistical.education.father">
                                </div>
                            </div>
                            <!-- 13. Mother's level of education -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">13.</span>Mother's level of
                                    education:
                                </div>
                                <div class="field-input-area">
                                    <input type="text" id="S_edu_mother" class="plain-input"
                                        ng-model="formData.statistical.education.mother">
                                </div>
                            </div>
                            <!-- 14. Father's Occupation -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">14.</span>Father's Occupation:
                                </div>
                                <div class="field-input-area">
                                    <input type="text" id="S_occ_father" class="plain-input"
                                        ng-model="formData.statistical.occupation.father">
                                </div>
                            </div>
                            <!-- 15. Mother's Occupation -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">15.</span>Mother's Occupation:
                                </div>
                                <div class="field-input-area">
                                    <input type="text" id="S_occ_mother" class="plain-input"
                                        ng-model="formData.statistical.occupation.mother">
                                </div>
                            </div>
                            <!-- 16. Age of mother (marriage) -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">16.</span>Age of mother (marriage) <span
                                        class="instruction-text">(completed years)</span>
                                </div>
                                <div class="field-input-area char-box-container">
                                    <input type="text" id="S_mam_c1" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.motherAgeMarriage.c1"
                                        ng-keyup="autoTab($event, 'S_mam_c2')"
                                        ng-keydown="handleBackspace($event, 'S_occ_mother')"><input type="text"
                                        id="S_mam_c2" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.motherAgeMarriage.c2"
                                        ng-keydown="handleBackspace($event, 'S_mam_c1')"
                                        ng-keyup="autoTab($event, 'S_mab_c1')">
                                </div>
                            </div>
                            <!-- 17. Age of mother (this birth) -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">17.</span>Age of mother (this birth)
                                    <span class="instruction-text">(completed years)</span>
                                </div>
                                <div class="field-input-area char-box-container">
                                    <input type="text" id="S_mab_c1" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.motherAgeBirth.c1"
                                        ng-keyup="autoTab($event, 'S_mab_c2')"
                                        ng-keydown="handleBackspace($event, 'S_mam_c2')"><input type="text"
                                        id="S_mab_c2" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.motherAgeBirth.c2"
                                        ng-keydown="handleBackspace($event, 'S_mab_c1')"
                                        ng-keyup="autoTab($event, 'S_ncb_c1')">
                                </div>
                            </div>
                            <!-- 18. Number of children born alive -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">18.</span>Number of children born
                                    alive... <span class="instruction-text">(including this
                                        child)</span>
                                </div>
                                <div class="field-input-area char-box-container">
                                    <input type="text" id="S_ncb_c1" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.numChildrenBornAlive.c1"
                                        ng-keyup="autoTab($event, 'S_ncb_c2')"
                                        ng-keydown="handleBackspace($event, 'S_mab_c2')"><input type="text"
                                        id="S_ncb_c2" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.numChildrenBornAlive.c2"
                                        ng-keydown="handleBackspace($event, 'S_ncb_c1')"
                                        ng-keyup="autoTab($event, 'S_da_instGovt')">
                                </div>
                            </div>
                            <!-- 19. Type of attention at delivery -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">19.</span>Type of attention at
                                    delivery <span class="instruction-text">(Tick
                                        appropriate)</span>
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delAtt"
                                            id="S_da_instGovt" ng-model="formData.statistical.deliveryAttention"
                                            value="Inst-Govt"><label class="form-check-label" for="S_da_instGovt">1.
                                            Institutional-Government</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delAtt"
                                            id="S_da_instPriv" ng-model="formData.statistical.deliveryAttention"
                                            value="Inst-Priv"><label class="form-check-label" for="S_da_instPriv">2.
                                            Institutional-Private or
                                            Non-Government</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delAtt"
                                            id="S_da_docNurse" ng-model="formData.statistical.deliveryAttention"
                                            value="DocNurseMidwife"><label class="form-check-label"
                                            for="S_da_docNurse">3.
                                            Doctor, Nurse or Trained Midwife</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delAtt" id="S_da_tba"
                                            ng-model="formData.statistical.deliveryAttention" value="TBA"><label
                                            class="form-check-label" for="S_da_tba">4. Traditional
                                            Birth Attendant</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delAtt"
                                            id="S_da_relatives" ng-model="formData.statistical.deliveryAttention"
                                            value="Relatives"><label class="form-check-label" for="S_da_relatives">5.
                                            Relatives or others</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 20. Method of Delivery -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">20.</span>Method of Delivery <span
                                        class="instruction-text">(Tick appropriate)</span>
                                </div>
                                <div class="field-input-area column-layout">
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delMethod"
                                            id="S_dm_natural" ng-model="formData.statistical.deliveryMethod"
                                            value="Natural"><label class="form-check-label" for="S_dm_natural">1.
                                            Natural</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delMethod"
                                            id="S_dm_caesarean" ng-model="formData.statistical.deliveryMethod"
                                            value="Caesarean"><label class="form-check-label" for="S_dm_caesarean">2.
                                            Caesarean</label>
                                    </div>
                                    <div class="form-check p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_delMethod"
                                            id="S_dm_forceps" ng-model="formData.statistical.deliveryMethod"
                                            value="ForcepsVacuum"><label class="form-check-label" for="S_dm_forceps">3.
                                            Forceps/Vacuum</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 21. Birth Weight -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">21.</span>Birth Weight (in kgs.):
                                </div>
                                <div class="field-input-area char-box-container">
                                    <input type="text" id="S_bw_kg1" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.birthWeight.kg1"
                                        ng-keyup="autoTab($event, 'S_bw_g1')"
                                        ng-keydown="handleBackspace($event, 'S_dm_natural')"><span
                                        class="char-sep">.</span><input type="text" id="S_bw_g1" class="char-box"
                                        maxlength="1" ng-model="formData.statistical.birthWeight.g1"
                                        ng-keyup="autoTab($event, 'S_bw_g2')"
                                        ng-keydown="handleBackspace($event, 'S_bw_kg1')"><input type="text" id="S_bw_g2"
                                        class="char-box" maxlength="1" ng-model="formData.statistical.birthWeight.g2"
                                        ng-keydown="handleBackspace($event, 'S_bw_g1')"
                                        ng-keyup="autoTab($event, 'S_dop_w1')">
                                </div>
                            </div>
                            <!-- 22. Duration of pregnancy -->
                            <div class="field-group">
                                <div class="field-label">
                                    <span class="label-number">22.</span>Duration of pregnancy
                                    (weeks):
                                </div>
                                <div class="field-input-area char-box-container">
                                    <input type="text" id="S_dop_w1" class="char-box" maxlength="1"
                                        ng-model="formData.statistical.durationPregnancy.w1"
                                        ng-keyup="autoTab($event, 'S_dop_w2')"
                                        ng-keydown="handleBackspace($event, 'S_bw_g2')"><input type="text" id="S_dop_w2"
                                        class="char-box" maxlength="1"
                                        ng-model="formData.statistical.durationPregnancy.w2"
                                        ng-keydown="handleBackspace($event, 'S_dop_w1')">
                                </div>
                            </div>
                            <p class="instruction-text mt-1">(In case of multiple
                                births...)</p>
                            <p class="instruction-text mt-1">(Columns to be filled are
                                over...)</p>

                            <!-- Registrar Fill Area (Statistical) -->
                            <div class="registrar-fill-area">
                                <div style="text-align: center; font-weight: bold; margin-bottom: 5px;">To
                                    be filled by the Registrar</div>
                                <div class="row gx-1">
                                    <div class="col-7">
                                        <input type="text" id="S_reg_name" class="plain-input" placeholder="Name"
                                            ng-model="formData.statistical.registrar.name">
                                    </div>
                                    <div class="col-5">
                                        <input type="text" id="S_reg_codeNo" class="plain-input" placeholder="Code No."
                                            ng-model="formData.statistical.registrar.codeNo">
                                    </div>
                                </div>
                                <input type="text" id="S_reg_district" class="plain-input mt-1" placeholder="District"
                                    ng-model="formData.statistical.registrar.district"> <input type="text"
                                    id="S_reg_subDistrict" class="plain-input mt-1" placeholder="Sub-District"
                                    ng-model="formData.statistical.registrar.subDistrict"> <input type="text"
                                    id="S_reg_townVillage" class="plain-input mt-1" placeholder="Town / Village"
                                    ng-model="formData.statistical.registrar.townVillage"> <input type="text"
                                    id="S_reg_regUnit" class="plain-input mt-1" placeholder="Registration Unit"
                                    ng-model="formData.statistical.registrar.regUnit"> <input type="text"
                                    id="S_reg_regNo" class="plain-input mt-1" placeholder="Registration No."
                                    ng-model="formData.statistical.registrar.regNo">
                                <div class="mt-1">
                                    <span class="sub-label">Registration Date:</span>
                                    <div class="char-box-container d-inline-flex">
                                        <input type="text" id="S_regd_d1" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.regDate.d1"
                                            ng-keyup="autoTab($event, 'S_regd_d2')"
                                            ng-keydown="handleBackspace($event, 'S_reg_regNo')"><input type="text"
                                            id="S_regd_d2" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.regDate.d2"
                                            ng-keyup="autoTab($event, 'S_regd_m1')"
                                            ng-keydown="handleBackspace($event, 'S_regd_d1')"><span
                                            class="char-sep">-</span><input type="text" id="S_regd_m1" class="char-box"
                                            maxlength="1" ng-model="formData.statistical.registrar.regDate.m1"
                                            ng-keyup="autoTab($event, 'S_regd_m2')"
                                            ng-keydown="handleBackspace($event, 'S_regd_d2')"><input type="text"
                                            id="S_regd_m2" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.regDate.m2"
                                            ng-keyup="autoTab($event, 'S_regd_y1')"
                                            ng-keydown="handleBackspace($event, 'S_regd_m1')"><span
                                            class="char-sep">-</span><input type="text" id="S_regd_y1" class="char-box"
                                            maxlength="1" ng-model="formData.statistical.registrar.regDate.y1"
                                            ng-keyup="autoTab($event, 'S_regd_y2')"
                                            ng-keydown="handleBackspace($event, 'S_regd_m2')"><input type="text"
                                            id="S_regd_y2" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.regDate.y2"
                                            ng-keyup="autoTab($event, 'S_regd_y3')"
                                            ng-keydown="handleBackspace($event, 'S_regd_y1')"><input type="text"
                                            id="S_regd_y3" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.regDate.y3"
                                            ng-keyup="autoTab($event, 'S_regd_y4')"
                                            ng-keydown="handleBackspace($event, 'S_regd_y2')"><input type="text"
                                            id="S_regd_y4" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.regDate.y4"
                                            ng-keydown="handleBackspace($event, 'S_regd_y3')"
                                            ng-keyup="autoTab($event, 'S_regdob_d1')">
                                    </div>
                                </div>
                                <div class="mt-1">
                                    <span class="sub-label">Date of Birth:</span>
                                    <div class="char-box-container d-inline-flex">
                                        <input type="text" id="S_regdob_d1" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.d1"
                                            ng-keyup="autoTab($event, 'S_regdob_d2')"
                                            ng-keydown="handleBackspace($event, 'S_regd_y4')"><input type="text"
                                            id="S_regdob_d2" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.d2"
                                            ng-keyup="autoTab($event, 'S_regdob_m1')"
                                            ng-keydown="handleBackspace($event, 'S_regdob_d1')"><span
                                            class="char-sep">-</span><input type="text" id="S_regdob_m1"
                                            class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.m1"
                                            ng-keyup="autoTab($event, 'S_regdob_m2')"
                                            ng-keydown="handleBackspace($event, 'S_regdob_d2')"><input type="text"
                                            id="S_regdob_m2" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.m2"
                                            ng-keyup="autoTab($event, 'S_regdob_y1')"
                                            ng-keydown="handleBackspace($event, 'S_regdob_m1')"><span
                                            class="char-sep">-</span><input type="text" id="S_regdob_y1"
                                            class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.y1"
                                            ng-keyup="autoTab($event, 'S_regdob_y2')"
                                            ng-keydown="handleBackspace($event, 'S_regdob_m2')"><input type="text"
                                            id="S_regdob_y2" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.y2"
                                            ng-keyup="autoTab($event, 'S_regdob_y3')"
                                            ng-keydown="handleBackspace($event, 'S_regdob_y1')"><input type="text"
                                            id="S_regdob_y3" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.y3"
                                            ng-keyup="autoTab($event, 'S_regdob_y4')"
                                            ng-keydown="handleBackspace($event, 'S_regdob_y2')"><input type="text"
                                            id="S_regdob_y4" class="char-box" maxlength="1"
                                            ng-model="formData.statistical.registrar.dob.y4"
                                            ng-keydown="handleBackspace($event, 'S_regdob_y3')"
                                            ng-keyup="autoTab($event, 'S_reg_sexMale')">
                                    </div>
                                </div>
                                <div class="mt-1">
                                    <span class="sub-label">Sex:</span>
                                    <div class="form-check form-check-inline p-0 me-1">
                                        <input class="form-check-input ms-0" type="radio" name="S_reg_sex"
                                            id="S_reg_sexMale" ng-model="formData.statistical.registrar.sex"
                                            value="M"><label class="form-check-label" for="S_reg_sexMale">M</label>
                                    </div>
                                    <div class="form-check form-check-inline p-0 me-1">
                                        <input class="form-check-input ms-0" type="radio" name="S_reg_sex"
                                            id="S_reg_sexFemale" ng-model="formData.statistical.registrar.sex"
                                            value="F"><label class="form-check-label" for="S_reg_sexFemale">F</label>
                                    </div>
                                    <div class="form-check form-check-inline p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_reg_sex"
                                            id="S_reg_sexTrans" ng-model="formData.statistical.registrar.sex"
                                            value="T"><label class="form-check-label" for="S_reg_sexTrans">T</label>
                                    </div>
                                </div>
                                <div class="mt-1">
                                    <span class="sub-label">Place of Birth:</span>
                                    <div class="form-check form-check-inline p-0 me-1">
                                        <input class="form-check-input ms-0" type="radio" name="S_reg_pob"
                                            id="S_reg_pobHosp" ng-model="formData.statistical.registrar.pob"
                                            value="Hosp"><label class="form-check-label"
                                            for="S_reg_pobHosp">1.Hosp</label>
                                    </div>
                                    <div class="form-check form-check-inline p-0 me-1">
                                        <input class="form-check-input ms-0" type="radio" name="S_reg_pob"
                                            id="S_reg_pobHouse" ng-model="formData.statistical.registrar.pob"
                                            value="House"><label class="form-check-label"
                                            for="S_reg_pobHouse">2.House</label>
                                    </div>
                                    <div class="form-check form-check-inline p-0">
                                        <input class="form-check-input ms-0" type="radio" name="S_reg_pob"
                                            id="S_reg_pobOther" ng-model="formData.statistical.registrar.pob"
                                            value="Other"><label class="form-check-label"
                                            for="S_reg_pobOther">3.Other</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr style="margin: 10px 0; border-top: 1px solid #000;">
                <div class="row">
                    <div class="col-5 offset-md-3 text-center">
                        <div class="signature-line" title="Main Registrar Signature Area"></div>
                        <input type="text" id="main_registrar_name" class="plain-input text-center"
                            placeholder="Name of Registrar" ng-model="formData.mainRegistrarSignatureName">
                        <div class="signature-label">Name and Signature of the
                            Registrar</div>
                    </div>
                </div>

                <div class="text-center mt-2 mb-2 no-print">
                    <button type="submit" class="btn btn-dark btn-sm">Submit
                        and Print</button>
                </div>
            </form>
        </div>

        <script>
            var app = angular.module('birthReportAppFull', []);
            app
                .controller(
                    'FormControllerFull',
                    function ($scope, $timeout) {
                        $scope.formData = {
                            legal: {
                                dob: {
                                    d1: '',
                                    d2: '',
                                    m1: '',
                                    m2: '',
                                    y1: '',
                                    y2: '',
                                    y3: '',
                                    y4: ''
                                },
                                sex: '',
                                child: {
                                    name: {
                                        first: '',
                                        middle: '',
                                        last: ''
                                    },
                                    aadhaar: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: '',
                                        c7: '',
                                        c8: '',
                                        c9: '',
                                        c10: '',
                                        c11: '',
                                        c12: ''
                                    }
                                },
                                father: {
                                    name: {
                                        first: '',
                                        middle: '',
                                        last: ''
                                    },
                                    aadhaar: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: '',
                                        c7: '',
                                        c8: '',
                                        c9: '',
                                        c10: '',
                                        c11: '',
                                        c12: ''
                                    },
                                    mobile: '',
                                    email: ''
                                },
                                mother: {
                                    name: {
                                        first: '',
                                        middle: '',
                                        last: ''
                                    },
                                    aadhaar: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: '',
                                        c7: '',
                                        c8: '',
                                        c9: '',
                                        c10: '',
                                        c11: '',
                                        c12: ''
                                    },
                                    mobile: '',
                                    email: ''
                                },
                                birthAddress: {
                                    houseNo: '',
                                    locality: '',
                                    wardNo: '',
                                    townVillage: '',
                                    subDistrict: '',
                                    district: '',
                                    pin: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: ''
                                    },
                                    state: ''
                                },
                                isPermAddressSame: false,
                                permAddress: {
                                    houseNo: '',
                                    locality: '',
                                    wardNo: '',
                                    townVillage: '',
                                    subDistrict: '',
                                    district: '',
                                    pin: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: ''
                                    },
                                    state: ''
                                },
                                pob: {
                                    type: '',
                                    name: '',
                                    otherSpecify: '',
                                    address: {
                                        houseNo: '',
                                        locality: '',
                                        wardNo: '',
                                        townVillage: '',
                                        subDistrict: '',
                                        district: '',
                                        pin: {
                                            c1: '',
                                            c2: '',
                                            c3: '',
                                            c4: '',
                                            c5: '',
                                            c6: ''
                                        },
                                        state: ''
                                    }
                                },
                                informant: {
                                    name: {
                                        first: '',
                                        middle: '',
                                        last: ''
                                    },
                                    aadhaar: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: '',
                                        c7: '',
                                        c8: '',
                                        c9: '',
                                        c10: '',
                                        c11: '',
                                        c12: ''
                                    },
                                    mobile: '',
                                    email: '',
                                    address: {
                                        houseNo: '',
                                        locality: '',
                                        wardNo: '',
                                        townVillage: '',
                                        subDistrict: '',
                                        district: '',
                                        pin: {
                                            c1: '',
                                            c2: '',
                                            c3: '',
                                            c4: '',
                                            c5: '',
                                            c6: ''
                                        },
                                        state: ''
                                    }
                                },
                                declarationAccepted: false,
                                informantSignDate: {
                                    d1: '',
                                    d2: '',
                                    m1: '',
                                    m2: '',
                                    y1: '',
                                    y2: '',
                                    y3: '',
                                    y4: ''
                                },
                                registrar: {
                                    regNo: '',
                                    regDate: {
                                        d1: '',
                                        d2: '',
                                        m1: '',
                                        m2: '',
                                        y1: '',
                                        y2: '',
                                        y3: '',
                                        y4: ''
                                    },
                                    regUnit: '',
                                    townVillage: '',
                                    subDistrict: '',
                                    district: '',
                                    remarks: ''
                                }
                            },
                            statistical: {
                                motherResidence: {
                                    type: '',
                                    name: '',
                                    address: {
                                        subDistrict: '',
                                        district: '',
                                        pin: {
                                            c1: '',
                                            c2: '',
                                            c3: '',
                                            c4: '',
                                            c5: '',
                                            c6: ''
                                        },
                                        state: ''
                                    }
                                },
                                religion: {
                                    father: '',
                                    mother: ''
                                },
                                education: {
                                    father: '',
                                    mother: ''
                                },
                                occupation: {
                                    father: '',
                                    mother: ''
                                },
                                motherAgeMarriage: {
                                    c1: '',
                                    c2: ''
                                },
                                motherAgeBirth: {
                                    c1: '',
                                    c2: ''
                                },
                                numChildrenBornAlive: {
                                    c1: '',
                                    c2: ''
                                },
                                deliveryAttention: '',
                                deliveryMethod: '',
                                birthWeight: {
                                    kg1: '',
                                    g1: '',
                                    g2: ''
                                },
                                durationPregnancy: {
                                    w1: '',
                                    w2: ''
                                },
                                registrar: {
                                    name: '',
                                    codeNo: '',
                                    district: '',
                                    subDistrict: '',
                                    townVillage: '',
                                    regUnit: '',
                                    regNo: '',
                                    regDate: {
                                        d1: '',
                                        d2: '',
                                        m1: '',
                                        m2: '',
                                        y1: '',
                                        y2: '',
                                        y3: '',
                                        y4: ''
                                    },
                                    dob: {
                                        d1: '',
                                        d2: '',
                                        m1: '',
                                        m2: '',
                                        y1: '',
                                        y2: '',
                                        y3: '',
                                        y4: ''
                                    },
                                    sex: '',
                                    pob: ''
                                }
                            },
                            mainRegistrarSignatureName: ''
                        };

                        $scope.autoTab = function (event, nextFieldId) {
                            var input = event.target;
                            if (input.value
                                && input.value.length >= input.maxLength
                                && nextFieldId) {
                                $timeout(
                                    function () {
                                        var nextField = document
                                            .getElementById(nextFieldId);
                                        if (nextField) {
                                            nextField.focus();
                                            if (typeof nextField.select === 'function') {
                                                nextField.select();
                                            }
                                        }
                                    }, 0);
                            }
                        };

                        $scope.handleBackspace = function (event,
                            prevFieldId) {
                            var input = event.target;
                            if (event.keyCode === 8
                                && input.value.length === 0
                                && prevFieldId) { // 8 is Backspace
                                $timeout(
                                    function () {
                                        var prevField = document
                                            .getElementById(prevFieldId);
                                        if (prevField) {
                                            prevField.focus();
                                            if (typeof prevField.select === 'function') {
                                                prevField.select();
                                            }
                                        }
                                    }, 0);
                            }
                        };

                        $scope.togglePermanentAddress = function () {
                            if ($scope.formData.legal.isPermAddressSame) {
                                // Optionally copy data
                                $scope.formData.legal.permAddress = angular
                                    .copy($scope.formData.legal.birthAddress);
                            } else {
                                // Optionally clear data
                                $scope.formData.legal.permAddress = {
                                    houseNo: '',
                                    locality: '',
                                    wardNo: '',
                                    townVillage: '',
                                    subDistrict: '',
                                    district: '',
                                    pin: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: ''
                                    },
                                    state: ''
                                };
                            }
                        };
                        $scope.togglePobDetails = function () {
                            // Example: if POB type changes, clear related specific fields
                            if ($scope.formData.legal.pob.type !== 'Hospital') {
                                $scope.formData.legal.pob.name = '';
                            }
                            if ($scope.formData.legal.pob.type !== 'Other') {
                                $scope.formData.legal.pob.otherSpecify = '';
                            }
                            if ($scope.formData.legal.pob.type === 'Other'
                                || !$scope.formData.legal.pob.type) { // if "Other" or nothing selected, clear address too
                                $scope.formData.legal.pob.address = {
                                    houseNo: '',
                                    locality: '',
                                    wardNo: '',
                                    townVillage: '',
                                    subDistrict: '',
                                    district: '',
                                    pin: {
                                        c1: '',
                                        c2: '',
                                        c3: '',
                                        c4: '',
                                        c5: '',
                                        c6: ''
                                    },
                                    state: ''
                                };
                            }
                        };

                        $scope.submitAndPrintForm = function () {
                            if ($scope.birthFormFull.$valid) { // Check AngularJS form validity
                                console
                                    .log(
                                        "Form Data to be 'submitted' and printed:",
                                        angular.toJson(
                                            $scope.formData,
                                            true));
                                window.print();
                            } else {
                                alert("Please review the form for any errors or missing required fields.");
                            }
                        };
                    });
        </script>
    </body>

    </html>