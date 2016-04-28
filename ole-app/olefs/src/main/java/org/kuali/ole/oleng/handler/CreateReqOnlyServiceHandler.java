package org.kuali.ole.oleng.handler;

import org.kuali.ole.Exchange;
import org.kuali.ole.oleng.service.OleNGRequisitionService;
import org.kuali.ole.utility.OleNgUtil;
import org.kuali.ole.pojo.OleOrderRecord;
import org.kuali.ole.select.document.OleRequisitionDocument;
import org.kuali.rice.krad.UserSession;
import org.kuali.rice.krad.util.GlobalVariables;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SheikS on 12/18/2015.
 */
@Service("createReqOnlyServiceHandler")
public class CreateReqOnlyServiceHandler extends OleNgUtil implements CreateReqAndPOBaseServiceHandler {

    private OleNGRequisitionService oleNGRequisitionService;

    public Integer processOrder(List<OleOrderRecord> oleOrderRecords, Exchange exchange) throws Exception {
        GlobalVariables.setUserSession(new UserSession("ole-quickstart"));
        OleRequisitionDocument requisitionDocument = oleNGRequisitionService.createNewRequisitionDocument();
        oleNGRequisitionService.populateReqDocWithOrderInformation(requisitionDocument, oleOrderRecords, exchange);
        oleNGRequisitionService.saveRequsitionDocument(requisitionDocument);
        return requisitionDocument.getPurapDocumentIdentifier();
    }

    public OleNGRequisitionService getOleNGRequisitionService() {
        return oleNGRequisitionService;
    }

    public void setOleNGRequisitionService(OleNGRequisitionService oleNGRequisitionService) {
        this.oleNGRequisitionService = oleNGRequisitionService;
    }
}
