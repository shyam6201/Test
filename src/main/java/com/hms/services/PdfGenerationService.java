package com.hms.services;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.hms.DTO.BirthSummaryRequest;
import com.hms.DTO.DischargeCardData;
import com.hms.DTO.DischargeCardDataMB;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.borders.DottedBorder;
import com.itextpdf.layout.borders.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.ListItem;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.properties.VerticalAlignment;

@Service
public class PdfGenerationService {

//    private PdfFont boldFont;
//    private PdfFont normalFont;
    private static final float DEFAULT_FONT_SIZE = 9f;
    private static final float SMALL_FONT_SIZE = 8f;
    private static final float LEADING_NORMAL = 1.2f;
    
    private static final float LARGE_FONT_SIZE = 11f;
    private static final float MIN_MOTHER_BABY_BOX_HEIGHT = 150f;

//    public PdfGenerationService() {
//        try {
//            boldFont = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);
//            normalFont = PdfFontFactory.createFont(StandardFonts.HELVETICA);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    public byte[] generateNormalDischargeCardPdf(DischargeCardData data) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(baos);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf, PageSize.A4);
        document.setMargins(36, 36, 36, 36);
        
        PdfFont boldFont = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);
        PdfFont normalFont = PdfFontFactory.createFont(StandardFonts.HELVETICA);

        // Logo
        if (data.getLogoPath() != null && !data.getLogoPath().isEmpty()) {
            try {
                ClassPathResource logoResource = new ClassPathResource(data.getLogoPath());
                if (logoResource.exists()) {
                    try (InputStream logoStream = logoResource.getInputStream()) {
                        byte[] logoBytes = logoStream.readAllBytes(); 
                        ImageData imageData = ImageDataFactory.create(logoBytes);
                        Image logo = new Image(imageData) 
                                .scaleToFit(50, 50)
                                .setHorizontalAlignment(HorizontalAlignment.LEFT)
                                .setFixedPosition(1, document.getLeftMargin(),
                                        document.getPageEffectiveArea(PageSize.A4).getTop() - 50);
                        document.add(logo); 
                    }
                }
            } catch (IOException e) {
                System.err.println("Error loading logo: " + e.getMessage());
            }
        }

        addHeader(document, data, boldFont,  normalFont);
        document.add(new Paragraph("\n").setMultipliedLeading(0.5f));

        Table patientTable = new Table(UnitValue.createPercentArray(new float[]{1, 2, 1, 2}))
                .setWidth(UnitValue.createPercentValue(100));

        addCellPairN(patientTable, "CRNo:", data.getCrNo(), boldFont,  normalFont);
        addCellPairN(patientTable, "Name:", data.getPatientName(), boldFont,  normalFont);

        addCellPairN(patientTable, "Address:", data.getAddress(), boldFont,  normalFont);
        addCellPairN(patientTable, "", "", boldFont,  normalFont); 

        addCellPairN(patientTable, "Age/Sex:", data.getAgeSex(), boldFont,  normalFont);
        addCellPairN(patientTable, "Mobile:", data.getMobile(), boldFont,  normalFont);

        addCellPairN(patientTable, "Date of Admission:", data.getDateOfAdmission(), boldFont,  normalFont);
        addCellPairN(patientTable, "Date of Discharge:", data.getDateOfDischarge(), boldFont,  normalFont);

//        addCellPairN(patientTable, "History:", data.getHistory(),boldFont,  normalFont);
//        addCellPairN(patientTable, "", "", boldFont,  normalFont);
        
        
       

       
        Cell hisLabelCell = new Cell()
                .add(new Paragraph("History:").setFont(boldFont))
                .setBorder(Border.NO_BORDER)
                .setPaddingTop(10f); 

        Cell hisDataCell = new Cell(1, 3) 
                .add(new Paragraph(data.getHistory()).setFont(normalFont))
                .setBorder(Border.NO_BORDER) 
                .setPaddingTop(10f);

        patientTable.addCell(hisLabelCell);
        patientTable.addCell(hisDataCell);
    

        Cell examLabelCell = new Cell()
                .add(new Paragraph("Examination:").setFont(boldFont))
                .setBorder(Border.NO_BORDER) 
                .setPaddingTop(10f); 

        Cell examDataCell = new Cell(1, 3) 
                .add(new Paragraph(data.getExaminationRespi() + ", " + data.getExaminationCvs()).setFont(normalFont))
                .setBorder(Border.NO_BORDER) 
                .setPaddingTop(10f); 

        patientTable.addCell(examLabelCell);
        patientTable.addCell(examDataCell);



        document.add(patientTable);
        document.add(new Paragraph("\n").setMultipliedLeading(0.5f));

//        addSectionTitleN(document, "Examination:", boldFont,  normalFont);
//        Table examTable = new Table(UnitValue.createPercentArray(new float[]{1, 5}))
//                .setWidth(UnitValue.createPercentValue(100));
//        addCellPairN(patientTable, "Examination:", data.getExaminationRespi()+","+data.getExaminationCvs(), boldFont,  normalFont);
        //addCellPairN(examTable, "CVS:", data.getExaminationCvs(), boldFont,  normalFont);
//        document.add(examTable);
//        document.add(new Paragraph("\n").setMultipliedLeading(0.5f));

        Table vitalsTable = new Table(UnitValue.createPercentArray(new float[]{1.2f, 1, 1.5f, 1, 1.2f, 1, 1, 1}))
                .setWidth(UnitValue.createPercentValue(100));
        addCellPairN(vitalsTable, "Temp(F):", data.getTempF(), boldFont,  normalFont);
        addCellPairN(vitalsTable, "BP S/D(mmHg):", data.getBpSmmHg(), boldFont,  normalFont);
        addCellPairN(vitalsTable, "Pulse/Min:", data.getPulseMin(), boldFont,  normalFont);
        addCellPairN(vitalsTable, "RR/Min:", data.getRrMin(), boldFont,  normalFont);
        document.add(vitalsTable);
        document.add(new Paragraph("\n").setMultipliedLeading(0.5f));

        addSectionTitleN(document, "Diagnosis:", boldFont,  normalFont);
        document.add(new Paragraph(data.getDiagnosis()).setMultipliedLeading(1.2f));
        document.add(new Paragraph("\n").setMultipliedLeading(0.5f));

        addListSection(document, "Treatment:", data.getTreatment(), boldFont,  normalFont);
        addListSection(document, "Advice:", data.getAdvice(), boldFont,  normalFont);

        Table bottomTable = new Table(UnitValue.createPercentArray(new float[]{1, 3, 1, 3}))
                .setWidth(UnitValue.createPercentValue(100));
        addCellPairN(bottomTable, "Refer:", data.getRefer(),  boldFont,  normalFont);
        addCellPairN(bottomTable, "StatusAtDischarge:", data.getStatusAtDischarge(),  boldFont,  normalFont);

        addCellPairN(bottomTable, "Remarks:", data.getRemarks(),  boldFont,  normalFont);
        addCellPairN(bottomTable, "", "",  boldFont,  normalFont);
        document.add(bottomTable);
        document.add(new Paragraph("\n"));

        Table signatureTable = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                .setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);

        signatureTable.addCell(new Cell().add(new Paragraph(data.getCounterSignatureLabel()))
                .setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT));

        signatureTable.addCell(new Cell().add(new Paragraph(data.getInternSignatureLabel()))
                .setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.RIGHT));

        signatureTable.setFixedPosition(document.getLeftMargin(), document.getBottomMargin() + 10,
                UnitValue.createPercentValue(100));
        document.add(signatureTable);

        document.close();
        return baos.toByteArray();
    }

    private void addHeader(Document document, DischargeCardData data,  PdfFont boldFont, PdfFont normalFont) {
        Table headerTable = new Table(1)
                .setWidth(UnitValue.createPercentValue(100))
                .setBorder(Border.NO_BORDER);

        headerTable.addCell(createBorderlessCellN(data.getHospitalProjectName(), boldFont, DEFAULT_FONT_SIZE + 1, TextAlignment.CENTER));
        headerTable.addCell(createBorderlessCellN(data.getHospitalAffiliation(), normalFont, DEFAULT_FONT_SIZE, TextAlignment.CENTER));
        headerTable.addCell(createBorderlessCellN(data.getHospitalName(), normalFont, DEFAULT_FONT_SIZE, TextAlignment.CENTER));
        headerTable.addCell(createBorderlessCellN(data.getDocumentTitle(), boldFont, DEFAULT_FONT_SIZE + 2, TextAlignment.CENTER).setPaddingBottom(5));

        document.add(headerTable);

        LineSeparator ls = new LineSeparator(new SolidLine(0.5f));
        ls.setStrokeColor(ColorConstants.BLACK);
        document.add(ls);
    }

    private Cell createBorderlessCellN(String text, PdfFont font, float fontSize, TextAlignment alignment) {
        return new Cell().add(new Paragraph(text).setFont(font).setFontSize(fontSize)
                        .setTextAlignment(alignment).setMultipliedLeading(LEADING_NORMAL))
                .setBorder(Border.NO_BORDER).setPadding(0);
    }

    private void addCellPairN(Table table, String label, String value, PdfFont boldFont, PdfFont normalFont) {
    	addCellPairN(table, label, value, DEFAULT_FONT_SIZE, DEFAULT_FONT_SIZE,  boldFont,  normalFont);
    }

    private void addCellPairN(Table table, String label, String value, float labelFontSize, float valueFontSize, PdfFont boldFont, PdfFont normalFont) {
        table.addCell(createLabelCellN(label, labelFontSize,  boldFont,  normalFont));
        table.addCell(createValueCellN(value, valueFontSize,  boldFont,  normalFont));
    }

   

    private Cell createLabelCellN(String text, float fontSize, PdfFont boldFont, PdfFont normalFont) {
        return new Cell().add(new Paragraph(text).setFont(boldFont).setFontSize(fontSize)
                        .setMultipliedLeading(LEADING_NORMAL))
                .setBorder(Border.NO_BORDER).setVerticalAlignment(VerticalAlignment.TOP)
                .setPadding(1).setPaddingRight(3);
    }

   

    private Cell createValueCellN(String text, float fontSize, PdfFont boldFont, PdfFont normalFont) {
        return new Cell().add(new Paragraph(text != null ? text : "").setFont(normalFont)
                        .setFontSize(fontSize).setMultipliedLeading(LEADING_NORMAL))
                .setBorder(Border.NO_BORDER).setVerticalAlignment(VerticalAlignment.TOP)
                .setPadding(1);
    }

 

    private void addSectionTitleN(Document document, String title, PdfFont boldFont, PdfFont normalFont) {
        document.add(new Paragraph(title).setFont(boldFont)
                .setFontSize(DEFAULT_FONT_SIZE).setMultipliedLeading(LEADING_NORMAL));
    }

    private void addListSection(Document document, String title, List<String> items, PdfFont boldFont, PdfFont normalFont) {
        if (items == null || items.isEmpty()) return;

        addSectionTitleN(document, title,  boldFont,  normalFont);

        com.itextpdf.layout.element.List list = new com.itextpdf.layout.element.List()
                .setSymbolIndent(12)
                .setListSymbol("") 
                .setFont(normalFont)
                .setFontSize(DEFAULT_FONT_SIZE);

        for (String item : items) {
            Paragraph para = new Paragraph(item)
                    .setFont(normalFont)
                    .setFontSize(DEFAULT_FONT_SIZE)
                    .setMultipliedLeading(LEADING_NORMAL);

            ListItem listItem = new ListItem();
            listItem.add(para);

            list.add(listItem);
        }

        document.add(list);
        document.add(new Paragraph("\n"));
    }


    
    
    public byte[] generateMaternityDischargeCardPdf(DischargeCardDataMB data) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(baos);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf, PageSize.A4);
        document.setMargins(36, 36, 36, 36); 
        
        PdfFont boldFont = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);
        PdfFont normalFont = PdfFontFactory.createFont(StandardFonts.HELVETICA);

        addHeader1(document, data,  boldFont,  normalFont);
        addPatientInfoBar(document, data,  boldFont,  normalFont);

        Table mainContentTable = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                .setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER)
                .setMargins(10f, 0, 5f, 0);

        Cell motherCell = new Cell().setBorder(Border.NO_BORDER).setPaddingRight(10f);
        addMotherDetails(motherCell, data,  boldFont,  normalFont);
        
        mainContentTable.addCell(motherCell);

        Cell babyCell = new Cell().setBorder(Border.NO_BORDER).setPaddingLeft(10f);
        addBabyDetails(babyCell, data,  boldFont,  normalFont);
        mainContentTable.addCell(babyCell);

        document.add(mainContentTable);

        addFooter(document, data, boldFont, normalFont);

        document.close();
        return baos.toByteArray();
    }

    private void addHeader1(Document document, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) throws IOException {
        Table headerTable = new Table(UnitValue.createPercentArray(new float[]{1.5f, 7f, 1.5f}))
                .setWidth(UnitValue.createPercentValue(100))
                .setBorder(Border.NO_BORDER);

        // Left Logo
        Cell leftLogoCell = new Cell().setBorder(Border.NO_BORDER).setVerticalAlignment(VerticalAlignment.MIDDLE);
        if (data.getLeftLogoPath() != null && !data.getLeftLogoPath().isEmpty()) {
            try {
                ClassPathResource logoResource = new ClassPathResource(data.getLeftLogoPath());
                if (logoResource.exists()) {
                    Image logo = new Image(ImageDataFactory.create(logoResource.getInputStream().readAllBytes()))
                            .scaleToFit(50, 50).setHorizontalAlignment(HorizontalAlignment.LEFT);
                    leftLogoCell.add(logo);
                }
            } catch (IOException e) { System.err.println("Left logo error: " + e.getMessage());}
        }
        headerTable.addCell(leftLogoCell);

        // Center Text
        Cell centerTextCell = new Cell().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.CENTER);
        centerTextCell.add(new Paragraph(data.getHospitalProjectName()).setFont(boldFont).setFontSize(LARGE_FONT_SIZE));
        centerTextCell.add(new Paragraph(data.getHospitalAffiliation()).setFont(normalFont).setFontSize(DEFAULT_FONT_SIZE));
        centerTextCell.add(new Paragraph(data.getHospitalName()).setFont(normalFont).setFontSize(DEFAULT_FONT_SIZE));
        centerTextCell.add(new Paragraph(data.getDocumentTitle()).setFont(boldFont).setFontSize(LARGE_FONT_SIZE + 2).setPaddingTop(3).setPaddingBottom(3));
        headerTable.addCell(centerTextCell);

        // Right Logo
        Cell rightLogoCell = new Cell().setBorder(Border.NO_BORDER).setVerticalAlignment(VerticalAlignment.MIDDLE);
         if (data.getRightLogoPath() != null && !data.getRightLogoPath().isEmpty()) {
            try {
                ClassPathResource logoResource = new ClassPathResource(data.getRightLogoPath());
                 if (logoResource.exists()) {
                    Image logo = new Image(ImageDataFactory.create(logoResource.getInputStream().readAllBytes()))
                            .scaleToFit(45, 45).setHorizontalAlignment(HorizontalAlignment.RIGHT); 
                    rightLogoCell.add(logo);
                }
            } catch (IOException e) { System.err.println("Right logo error: " + e.getMessage());}
        }
        headerTable.addCell(rightLogoCell);
        document.add(headerTable);

        LineSeparator ls = new LineSeparator(new SolidLine(1f));
        document.add(ls.setMarginBottom(5f));
    }

    private void addPatientInfoBar(Document document, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) {
        Table infoTable = new Table(UnitValue.createPercentArray(new float[]{1.2f, 2.8f, 2.5f, 3.5f, 0.8f, 1.2f}))
            .setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER)
            .setFixedLayout()
            .setFontSize(SMALL_FONT_SIZE);

        infoTable.addCell(createBorderlessCell("CRNo:", boldFont));
        infoTable.addCell(createBorderlessCell(data.getCrNo(), normalFont));
        infoTable.addCell(createBorderlessCell("Smt. " + data.getPatientName(), normalFont));

        infoTable.addCell(createBorderlessCell("Age:", boldFont).setTextAlignment(TextAlignment.RIGHT));
        infoTable.addCell(createBorderlessCell(data.getPatientAge() + " years", normalFont).setTextAlignment(TextAlignment.LEFT));

        document.add(infoTable);

        Table addressDatesTable = new Table(UnitValue.createPercentArray(new float[]{6, 4}))
            .setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER)
            .setFixedLayout()
            .setFontSize(SMALL_FONT_SIZE).setMarginBottom(8f);

        Cell addressCell = createBorderlessCell("", normalFont).setPaddingRight(10f);
        addressCell.add(new Paragraph()
            .add(new Text("Address: ").setFont(boldFont))
            .add(new Text(data.getAddress() + "\nMobile: " + data.getMobile()).setFont(normalFont))
        );
        addressDatesTable.addCell(addressCell);

        Cell datesCell = createBorderlessCell("", normalFont);
        Table datesInnerTable = new Table(UnitValue.createPercentArray(new float[]{1, 2}))
            .setBorder(Border.NO_BORDER)
            .setWidth(UnitValue.createPercentValue(100));

        addCellPair(datesInnerTable, "DOA:", data.getDateOfAdmission(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(datesInnerTable, "DOD:", data.getDateOfDischarge(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);

        datesCell.add(datesInnerTable);
        addressDatesTable.addCell(datesCell);
        document.add(addressDatesTable);
    }


    private void addMotherDetails(Cell parentCell, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) {
        parentCell.add(new Paragraph("Mother's Details:-").setFont(boldFont).setFontSize(DEFAULT_FONT_SIZE).setMarginBottom(3f));
        parentCell.add(new Paragraph(data.getMotherGpla()).setFont(normalFont).setFontSize(SMALL_FONT_SIZE));

        Table motherGrid = new Table(UnitValue.createPercentArray(new float[]{1,1.5f,0.8f,1.5f})).setWidth(UnitValue.createPercentValue(100));
        addCellPair(motherGrid, "LMP:", data.getMotherLmp(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(motherGrid, "PoG:", data.getMotherPog(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(motherGrid, "Blood Group:", data.getMotherBloodGroup(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(motherGrid, "BP (S/D):", data.getBpSmmHg(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(motherGrid, "Urine Albumin:", data.getMotherUrineAlbumin(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(motherGrid, "UrineSugar:", data.getMotherUrineSugar(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(motherGrid, "HB:", data.getMotherHb(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        motherGrid.addCell(createBorderlessCell("", normalFont)); 
        parentCell.add(motherGrid);

        parentCell.add(new Paragraph().add(new Text("USG: ").setFont(boldFont).setFontSize(SMALL_FONT_SIZE))
            .add(new Text(data.getMotherUsg()).setFont(normalFont).setFontSize(SMALL_FONT_SIZE)));

        parentCell.add(new Paragraph("Mother").setFont(boldFont).setFontSize(DEFAULT_FONT_SIZE + 1).setTextAlignment(TextAlignment.CENTER).setMargins(8f,0,3f,0));

        addSectionWithItems(parentCell, "Diagnosis :-", data.getMotherDiagnosisList(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE,  boldFont,  normalFont);
        addSectionWithItems(parentCell, "Complications:-", data.getMotherComplications(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE,  boldFont,  normalFont);
        addSectionWithItems(parentCell, "Treatment:-", data.getMotherTreatment(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE,  boldFont,  normalFont);
        addSectionWithItems(parentCell, "Advice:-", data.getMotherAdvice(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE,  boldFont,  normalFont);
    }
    
    
//    private void addMotherDetails(Cell parentCell, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) {
//        // Create a box using a table with a single cell
//        Table boxTable = new Table(1)
//                .setWidth(UnitValue.createPercentValue(100))
//                .setBorder(new SolidBorder(1f)); // Border for the entire box
//               
//
//        // Inner cell for content (no inner borders)
//        Cell boxContent = new Cell()
//                .setBorder(Border.NO_BORDER)
//                .setPadding(5f).setMinHeight(MIN_MOTHER_BABY_BOX_HEIGHT);
//
//        // Add title and GPLa
//        boxContent.add(new Paragraph("Mother's Details:-")
//                .setFont(boldFont)
//                .setFontSize(DEFAULT_FONT_SIZE)
//                .setMarginBottom(2f));
//
//        boxContent.add(new Paragraph(data.getMotherGpla())
//                .setFont(normalFont)
//                .setFontSize(SMALL_FONT_SIZE));
//
//        // Mother detail grid
//        Table motherGrid = new Table(UnitValue.createPercentArray(new float[]{1,1.5f,0.8f,1.5f}))
//                .setWidth(UnitValue.createPercentValue(100));
//        addCellPair(motherGrid, "LMP:", data.getMotherLmp(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(motherGrid, "PoG:", data.getMotherPog(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(motherGrid, "Blood Group:", data.getMotherBloodGroup(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(motherGrid, "BP (S/D):", data.getBpSmmHg(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(motherGrid, "Urine Albumin:", data.getMotherUrineAlbumin(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(motherGrid, "UrineSugar:", data.getMotherUrineSugar(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(motherGrid, "HB:", data.getMotherHb(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        motherGrid.addCell(createBorderlessCell("", normalFont)); // Spacer cell
//
//        // Add grid and USG info to box
//        boxContent.add(motherGrid);
//        boxContent.add(new Paragraph()
//                .add(new Text("USG: ").setFont(boldFont).setFontSize(SMALL_FONT_SIZE))
//                .add(new Text(data.getMotherUsg()).setFont(normalFont).setFontSize(SMALL_FONT_SIZE)));
//
//        // Add inner content to box, then box to parent cell
//        boxTable.addCell(boxContent);
//        parentCell.add(boxTable);
//
//        // Continue with other sections (outside the box)
//        parentCell.add(new Paragraph("Mother")
//                .setFont(boldFont)
//                .setFontSize(DEFAULT_FONT_SIZE + 1)
//                .setTextAlignment(TextAlignment.CENTER)
//                .setMargins(8f, 0, 3f, 0));
//
//        addSectionWithItems(parentCell, "Diagnosis :-", data.getMotherDiagnosisList(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addSectionWithItems(parentCell, "Complications:-", data.getMotherComplications(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addSectionWithItems(parentCell, "Treatment:-", data.getMotherTreatment(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addSectionWithItems(parentCell, "Advice:-", data.getMotherAdvice(), DEFAULT_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//    }


    private void addBabyDetails(Cell parentCell, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) {
        parentCell.add(new Paragraph("Baby Details :-").setFont(boldFont).setFontSize(DEFAULT_FONT_SIZE).setMarginBottom(3f));

        Table babyGrid = new Table(UnitValue.createPercentArray(new float[]{1.8f,2.2f})).setWidth(UnitValue.createPercentValue(100));
        addCellPair(babyGrid, "Baby Cr No:", data.getBabyCrNo(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(babyGrid, "Status at delivery:", data.getBabyStatusAtDelivery(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(babyGrid, "Date and Time of Birth:", data.getBabyDateTimeOfBirth(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(babyGrid, "Sex:", data.getBabySex(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(babyGrid, "Weight:", data.getBabyWeight(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        addCellPair(babyGrid, "Blood Group:", data.getBabyBloodGroup(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
        parentCell.add(babyGrid);


        parentCell.add(new Paragraph("Baby").setFont(boldFont).setFontSize(DEFAULT_FONT_SIZE + 1).setTextAlignment(TextAlignment.CENTER).setMargins(8f,0,3f,0));

        if (data.getBabyDiagnosisList() != null && !data.getBabyDiagnosisList().isEmpty()){
            addItemsOnly(parentCell, data.getBabyDiagnosisList(), SMALL_FONT_SIZE, false,  boldFont,  normalFont);
        }

        if (data.getBabyComplications() != null && !data.getBabyComplications().isEmpty()) {
             addItemsOnly(parentCell, data.getBabyComplications(), SMALL_FONT_SIZE, true,  boldFont,  normalFont); // true for a small top margin
        }

        addItemsOnly(parentCell, data.getBabyTreatment(), SMALL_FONT_SIZE, true,  boldFont,  normalFont);
        addItemsOnly(parentCell, data.getBabyAdvice(), SMALL_FONT_SIZE, true,  boldFont,  normalFont);
    }
    
    
//    private void addBabyDetails(Cell parentCell, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) {
//        // Create a bordered box for baby section
//        Table babyBox = new Table(1)
//                .setWidth(UnitValue.createPercentValue(100))
//                .setBorder(new SolidBorder(1f));
//               
//
//        Cell boxContent = new Cell()
//                .setBorder(Border.NO_BORDER)
//                .setPadding(5f).setMinHeight(MIN_MOTHER_BABY_BOX_HEIGHT);
//
//        // Move heading inside the box
//        boxContent.add(new Paragraph("Baby Details :-")
//                .setFont(boldFont)
//                .setFontSize(DEFAULT_FONT_SIZE)
//                .setMarginBottom(2f));
//
//        // Baby grid inside the box
//        Table babyGrid = new Table(UnitValue.createPercentArray(new float[]{1.8f, 2.2f}))
//                .setWidth(UnitValue.createPercentValue(100));
//
//        addCellPair(babyGrid, "Baby Cr No:", data.getBabyCrNo(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(babyGrid, "Status at delivery:", data.getBabyStatusAtDelivery(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(babyGrid, "Date and Time of Birth:", data.getBabyDateTimeOfBirth(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(babyGrid, "Sex:", data.getBabySex(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(babyGrid, "Weight:", data.getBabyWeight(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//        addCellPair(babyGrid, "Blood Group:", data.getBabyBloodGroup(), SMALL_FONT_SIZE, SMALL_FONT_SIZE, boldFont, normalFont);
//
//        boxContent.add(babyGrid);
//        babyBox.addCell(boxContent);
//        parentCell.add(babyBox);
//
//        // Subsection title
//        parentCell.add(new Paragraph("Baby")
//                .setFont(boldFont)
//                .setFontSize(DEFAULT_FONT_SIZE + 1)
//                .setTextAlignment(TextAlignment.CENTER)
//                .setMargins(8f, 0, 3f, 0));
//
//        // Details below box
//        if (data.getBabyDiagnosisList() != null && !data.getBabyDiagnosisList().isEmpty()) {
//            addItemsOnly(parentCell, data.getBabyDiagnosisList(), SMALL_FONT_SIZE, false, boldFont, normalFont);
//        }
//
//        if (data.getBabyComplications() != null && !data.getBabyComplications().isEmpty()) {
//            addItemsOnly(parentCell, data.getBabyComplications(), SMALL_FONT_SIZE, true, boldFont, normalFont);
//        }
//
//        addItemsOnly(parentCell, data.getBabyTreatment(), SMALL_FONT_SIZE, true, boldFont, normalFont);
//        addItemsOnly(parentCell, data.getBabyAdvice(), SMALL_FONT_SIZE, true, boldFont, normalFont);
//    }



    private void addFooter(Document document, DischargeCardDataMB data, PdfFont boldFont, PdfFont normalFont) {
        document.add(new Paragraph("\n")); 

        Table remarksTable = new Table(1).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);
        Cell rCell = createBorderlessCell("", normalFont);
        rCell.add(new Paragraph("Remarks, if any:").setFont(boldFont).setFontSize(DEFAULT_FONT_SIZE));
        
        if (data.getRemarks() != null && !data.getRemarks().isEmpty()) {
            rCell.add(new Paragraph(data.getRemarks()).setFont(normalFont).setFontSize(SMALL_FONT_SIZE));
        } else {
            rCell.add(new Paragraph("\n")); 
        }
        remarksTable.addCell(rCell);
        document.add(remarksTable);

        document.add(new Paragraph().setMarginTop(10f));
        
        
        
//        Table referTable = new Table(1).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);
//        Cell referCell = createBorderlessCell("", normalFont);
//        referCell.add(new Paragraph("Refer:").setFont(boldFont).setFontSize(DEFAULT_FONT_SIZE));
//        
//        if (data.getRefer() != null && !data.getRefer().isEmpty()) {
//        	referCell.add(new Paragraph(data.getRefer()).setFont(normalFont).setFontSize(SMALL_FONT_SIZE));
//        } else {
//        	referCell.add(new Paragraph("\n")); 
//        }
//        referTable.addCell(referCell);
//        document.add(referTable);
//
//        document.add(new Paragraph().setMarginTop(5f));
        

        Table finalSignatureTable = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                .setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);

        Cell leftSigCell = createBorderlessCell("", normalFont).setTextAlignment(TextAlignment.LEFT).setVerticalAlignment(VerticalAlignment.BOTTOM);
        
        leftSigCell.add(new Paragraph("Counter Signature of Senior Resident/ Faculty").setFont(boldFont).setFontSize(SMALL_FONT_SIZE));
        finalSignatureTable.addCell(leftSigCell);

        Cell rightSigCell = createBorderlessCell("", normalFont).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.BOTTOM);

        rightSigCell.add(new Paragraph("Signature of Intern/J.R/S.R.").setFont(boldFont).setFontSize(SMALL_FONT_SIZE));
        finalSignatureTable.addCell(rightSigCell);

        document.add(finalSignatureTable);
    }

    private Cell createBorderlessCell(String text, PdfFont font) {
        return new Cell().add(new Paragraph(text).setFont(font))
                .setBorder(Border.NO_BORDER).setPadding(1);
    }

    private void addCellPair(Table table, String label, String value, float fontSize, float valueFontSize, PdfFont labelFont, PdfFont valFont) {
        table.addCell(new Cell().add(new Paragraph(label).setFont(labelFont).setFontSize(fontSize))
                        .setBorder(Border.NO_BORDER).setPadding(1).setPaddingRight(3).setVerticalAlignment(VerticalAlignment.TOP));
        table.addCell(new Cell().add(new Paragraph(value != null ? value : "").setFont(valFont).setFontSize(valueFontSize))
                        .setBorder(Border.NO_BORDER).setPadding(1).setVerticalAlignment(VerticalAlignment.TOP));
    }

    private void addSectionWithItems(Cell parentCell, String title, List<String> items, float titleFontSize, float itemFontSize, PdfFont boldFont, PdfFont normalFont) {
        if (title != null && !title.isEmpty()) {
            parentCell.add(new Paragraph(title).setFont(boldFont).setFontSize(titleFontSize).setMarginTop(5f).setMarginBottom(2f));
        }
        if (items == null || items.isEmpty()) {
            if ("Complications:-".equals(title)) { 
                 parentCell.add(new Paragraph("NONE").setFont(normalFont).setFontSize(itemFontSize).setMarginBottom(3f));
            }
            return;
        }
        for (String item : items) {
            parentCell.add(new Paragraph(item).setFont(normalFont).setFontSize(itemFontSize));
        }
        parentCell.add(new Paragraph().setMarginBottom(3f)); 
    }

    private void addItemsOnly(Cell parentCell, List<String> items, float itemFontSize, boolean addTopMargin, PdfFont boldFont, PdfFont normalFont) {
        if (items == null || items.isEmpty()) return;

        boolean first = true;
        for (String item : items) {
            Paragraph p = new Paragraph(item).setFont(normalFont).setFontSize(itemFontSize);
            if (first && addTopMargin) {
                p.setMarginTop(3f);
                first = false;
            }
            parentCell.add(p);
        }
        parentCell.add(new Paragraph("\n\n"));
        parentCell.add(new Paragraph().setMarginBottom(10f)); 
    }

  
    
    public byte[] generateBirthSummaryPdf(BirthSummaryRequest request) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(baos);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf, PageSize.A4);
        document.setMargins(72, 36, 72, 36); // 1 inch top/bottom, 0.5 inch left/right

        // Define fonts
        PdfFont bold = PdfFontFactory.createFont("Helvetica-Bold");
        PdfFont regular = PdfFontFactory.createFont("Helvetica");

        // 1. Title
        Paragraph title = new Paragraph("BIRTH SUMMARY")
                .setFont(bold).setFontSize(16)
                .setTextAlignment(TextAlignment.CENTER)
                .setUnderline(1, -2); 
        document.add(title);
        document.add(new Paragraph("\n\n"));

        // 2. Main Info Table
        float[] columnWidths = {25f, 50f, 25f}; // Label, Value, Hint
        Table table = new Table(UnitValue.createPercentArray(columnWidths)).useAllAvailableWidth();

        // Row 1: Mother
        table.addCell(createCell(request.getGender() + " baby of", regular, TextAlignment.LEFT).setBold());
        
        table.addCell(createValueCell(request.getMotherName(), regular));
        table.addCell(createCell("(Mother's name)", regular, TextAlignment.LEFT));

        // Row 2: Father
        table.addCell(createCell("w/o", regular, TextAlignment.LEFT));
        table.addCell(createValueCell(request.getFatherName(), regular));
        table.addCell(createCell("(Father's name)", regular, TextAlignment.LEFT));

        // Row 3: Address
        table.addCell(createCell("Address", regular, TextAlignment.LEFT));
        table.addCell(createValueCell(request.getAddress(), regular));
        table.addCell(createValueCell("", regular));
        

        document.add(table);
        document.add(new Paragraph("\n"));

        // 3. Delivery Details Line
        Paragraph deliveryPara = new Paragraph();
        deliveryPara.add(new Text("Delivered on ").setFont(regular));
        deliveryPara.add(new Text(request.getDeliveryDate()).setUnderline());
        deliveryPara.add(new Text(" (Date) at ").setFont(regular));
        deliveryPara.add(new Text(request.getDeliveryTime()).setUnderline());
        deliveryPara.add(new Text(" through ").setFont(regular));

        String[] methods = {"NVD", "LSCS", "FORCEPS", "VACUUM"};
        for (int i = 0; i < methods.length; i++) {
            Text methodText = new Text(methods[i]);
            if (methods[i].equalsIgnoreCase(request.getDeliveryMethod())) {
                methodText.setFont(bold).setUnderline();
            } else {
                methodText.setFont(regular);
            }
            deliveryPara.add(methodText);
            if (i < methods.length - 1) {
                deliveryPara.add("/");
            }
        }
        document.add(deliveryPara);
        document.add(new Paragraph("\n"));

        // 4. Static text
        document.add(new Paragraph("DELIVERY in the General Ward of CRHSP AIIMS, Ballabgarh, District Faridabad.").setFont(bold));
        document.add(new Paragraph("\n"));
        document.add(new Paragraph("This is for the Birth Registration Information.").setFont(regular));

        // 5. Signature Block
        document.add(new Paragraph("\n\n\n\n")); // Add vertical space

        Paragraph signatureBlock = new Paragraph()
                .add("Senior Resident\n")
                .add("(MD) Obs. & Gynae.\n")
                .add("CRHSP AIIMS, Ballabgarh")
                .setTextAlignment(TextAlignment.RIGHT)
                .setMarginRight(20);
        document.add(signatureBlock);

        document.close();
        return baos.toByteArray();
    }

    private Cell createCell(String text, PdfFont font, TextAlignment alignment) {
        return new Cell()
                .add(new Paragraph(text).setFont(font).setTextAlignment(alignment))
                .setBorder(Border.NO_BORDER)
                .setVerticalAlignment(VerticalAlignment.BOTTOM)
                .setPadding(2);
    }

    private Cell createValueCell(String text, PdfFont font) {
        return new Cell()
                .add(new Paragraph(text).setFont(font))
                .setBorder(Border.NO_BORDER)
                .setBorderBottom(new DottedBorder(1))
                .setVerticalAlignment(VerticalAlignment.BOTTOM)
                .setPadding(2);
    }

  

}
