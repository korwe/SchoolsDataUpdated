package schoolsdata



import org.junit.*
import grails.test.mixin.*

@TestFor(SchoolsDataController)
@Mock(SchoolsData)
class SchoolsDataControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/schoolsData/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.schoolsDataInstanceList.size() == 0
        assert model.schoolsDataInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.schoolsDataInstance != null
    }

    void testSave() {
        controller.save()

        assert model.schoolsDataInstance != null
        assert view == '/schoolsData/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/schoolsData/show/1'
        assert controller.flash.message != null
        assert SchoolsData.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/schoolsData/list'

        populateValidParams(params)
        def schoolsData = new SchoolsData(params)

        assert schoolsData.save() != null

        params.id = schoolsData.id

        def model = controller.show()

        assert model.schoolsDataInstance == schoolsData
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/schoolsData/list'

        populateValidParams(params)
        def schoolsData = new SchoolsData(params)

        assert schoolsData.save() != null

        params.id = schoolsData.id

        def model = controller.edit()

        assert model.schoolsDataInstance == schoolsData
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/schoolsData/list'

        response.reset()

        populateValidParams(params)
        def schoolsData = new SchoolsData(params)

        assert schoolsData.save() != null

        // test invalid parameters in update
        params.id = schoolsData.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/schoolsData/edit"
        assert model.schoolsDataInstance != null

        schoolsData.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/schoolsData/show/$schoolsData.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        schoolsData.clearErrors()

        populateValidParams(params)
        params.id = schoolsData.id
        params.version = -1
        controller.update()

        assert view == "/schoolsData/edit"
        assert model.schoolsDataInstance != null
        assert model.schoolsDataInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/schoolsData/list'

        response.reset()

        populateValidParams(params)
        def schoolsData = new SchoolsData(params)

        assert schoolsData.save() != null
        assert SchoolsData.count() == 1

        params.id = schoolsData.id

        controller.delete()

        assert SchoolsData.count() == 0
        assert SchoolsData.get(schoolsData.id) == null
        assert response.redirectedUrl == '/schoolsData/list'
    }
}
