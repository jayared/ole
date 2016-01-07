package org.kuali.ole.spring.batch.handlers;

import org.apache.commons.lang3.StringUtils;
import org.marc4j.marc.Record;

import java.util.StringTokenizer;

/**
 * Created by SheikS on 1/6/2016.
 */
public class MoveStepHandler extends StepHandler {

    /*Eg of source field -  001 or 050 $a$b$c or any thing.
     Eg of destination field - 035 $a$b,040 $c$b or anything.
        */
    @Override
    public void processSteps(Record marcRecord) {
        String sourceFieldString = getBatchProfileDataTransformer().getSourceField();

        String sourceFieldStringArray[] = sourceFieldString.split("[' ']");

        String sourceField = sourceFieldStringArray[0];

        String value = null;
        if(getMarcRecordUtil().isControlField(sourceField)) {
            value = getMarcRecordUtil().getControlFieldValue(marcRecord, sourceField);
        } else {
            String sourceSubField = (sourceFieldStringArray.length > 1 ?  sourceFieldStringArray[1] : "");
            value = getMarcRecordUtil().getDataFieldValue(marcRecord,sourceField,sourceSubField);
        }
        if(StringUtils.isBlank(value)) {
            value = getBatchProfileDataTransformer().getConstant();
        }

        String destinationFieldString = getBatchProfileDataTransformer().getDestinationField();
        StringTokenizer destinationFieldTokenizer = new StringTokenizer(destinationFieldString,",");

        if (StringUtils.isNotBlank(value)) {
            while(destinationFieldTokenizer.hasMoreTokens()){
                String destination = destinationFieldTokenizer.nextToken();
                String destinationArray[] = destination.split("[' ']");
                String destinationField = destinationArray[0];
                String destinationSubField = (destinationArray.length > 1 ?  destinationArray[1] : "");

                if (!getMarcRecordUtil().isControlField(destinationField)) {
                    getMarcRecordUtil().addDataField(marcRecord,destinationField,destinationSubField,value);
                } else {
                    getMarcRecordUtil().addControlField(marcRecord,destinationField,value);
                }
                getMarcRecordUtil().removeFieldFromRecord(marcRecord,sourceField);

            }
        }
    }

    @Override
    public Boolean isInterested(String operation) {
        return operation.equalsIgnoreCase("Move");
    }
}