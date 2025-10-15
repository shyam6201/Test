package com.hms.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DischargeCardDataMB {

	
	private String leftLogoPath;
    private String rightLogoPath;
    private String hospitalProjectName;
    private String hospitalAffiliation;
    private String hospitalName;
    private String documentTitle;

    // Patient Bar Info
    private String crNo; // Main CRNo at the top
    private String patientName; // Smt. [Name] W/o Shri. [Spouse Name]
    private String patientAge; // e.g., "24" (years will be appended in PDF)
    private String address; // Full address including market, colony, Ballabgarh, Distt.
    private String mobile;
    private String dateOfAdmission; // DOA
    private String dateOfDischarge; // DOD

    // Mother's Details
    private String motherGpla; // e.g., G4 P3 L2 A0
    private String motherLmp; // e.g., 02-07-2024
    private String motherPog; // e.g., :39 W 3 D
    private String motherBloodGroup; // e.g., O-
    private String bpSmmHg; // e.g., 123 / 81 mmHg (Used for mother's BP)
    private String motherUrineAlbumin; // e.g., NIL
    private String motherUrineSugar; // e.g., NIL
    private String motherHb; // e.g., 10.10 gm%
    private String motherUsg; // e.g., SLIUP, CEPHALIC PRESENTATION, LIQUOR ADEQUATE, PLACENTA UPPER SEGMENT

    // Mother's Clinical Sections
    private List<String> motherDiagnosisList;
    private List<String> motherComplications;
    private List<String> motherTreatment;
    private List<String> motherAdvice;

    // Baby's Details
    private String babyCrNo; // e.g., 1599/2025
    private String babyStatusAtDelivery; // e.g., Live
    private String babyDateTimeOfBirth; // e.g., 05/04/2025 / 04:15PM
    private String babySex; // e.g., Female
    private String babyWeight; // e.g., 2,310 gms
    private String babyBloodGroup; // e.g., A-

    // Baby's Clinical Sections
    private List<String> babyDiagnosisList; // e.g., ["FULL TERM NORMAL VAGINAL DELIVERY"]
    private List<String> babyComplications; // e.g., ["NONE"] or specific complications
    private List<String> babyTreatment; // Includes injections and "Breastfeeding Started"
    private List<String> babyAdvice;

    // Footer Info
    private String remarks;
    private String refer;
    private String counterSignatureLabel; // e.g., Counter Signature of Senior Resident/ Faculty
    private String internSignatureLabel; // e.g., Signature of Intern/ J.R/ S.R..
}
