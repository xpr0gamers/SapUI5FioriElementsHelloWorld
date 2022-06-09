import cds from "@sap/cds";

export = class ServiceImpl extends cds.ApplicationService {
    async init(): Promise<void> {
        await super.init();
    }
}
