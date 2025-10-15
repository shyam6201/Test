package com.hms.DTO;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DischargeCardData {
    private String hospitalProjectName = "COMPREHENSIVE RURAL HEALTH SERVICES PROJECT, BALLABGARH";
    private String hospitalAffiliation = "(AIIMS, New Delhi)";
    private String hospitalName = "Civil Hospital, Ballabhgarh";
    private String documentTitle = "Discharge Card";

    private String crNo;
    private String patientName;
    private String ageSex;
    private String address;
    private String mobile;
    private String dateOfAdmission;
    private String dateOfDischarge;
    private String history;

    private String examinationRespi;
    private String examinationCvs;

    private String tempF;
    private String bpSmmHg;
    private String pulseMin;
    private String rrMin;

    private String diagnosis;

    private List<String> treatment;

    private List<String> advice;

    private String refer = ""; 
    private String remarks = ""; 
    private String statusAtDischarge;

    private String counterSignatureLabel = "Counter Signature of JR/ S R/ Faculty";
    private String internSignatureLabel = "Signature of Intern";

    
    private String logoPath; 
}
