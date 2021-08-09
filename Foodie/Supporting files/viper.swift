
import UIKit

// MARK: - View
class ModuleViewController: UIViewController, ModuleViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Properties
    var presenter: ModulePresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func setupUI() {

    }
}

// MARK: - Interactor
class ModuleInteractor: ModuleInteractorProtocol {
    var presenter: ModulePresenterProtocol?
}

// MARK: - Presenter
class ModulePresenter: ModulePresenterProtocol {
    var view: ModuleViewProtocol?
    var interactor: ModuleInteractorProtocol?
    var router: ModuleRouterProtocol?
}

// MARK: - Router
class ModuleRouter: ModuleRouterProtocol {
    func createModule() -> UIViewController & ModuleViewProtocol {
        var view: UIViewController & ModuleViewProtocol = ModuleViewController()
        var interactor: ModuleInteractorProtocol = ModuleInteractor()
        var presenter: ModulePresenterProtocol = ModulePresenter()
        let router: ModuleRouterProtocol = ModuleRouter()
        
        view.presenter = presenter

        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}

// MARK: - Protocols
protocol ModuleViewProtocol {
    var presenter: ModulePresenterProtocol? {get set}
}
protocol ModuleInteractorProtocol {
    var presenter: ModulePresenterProtocol? {get set}
}
protocol ModulePresenterProtocol {
    var view: ModuleViewProtocol? {get set}
    var interactor: ModuleInteractorProtocol? {get set}
    var router: ModuleRouterProtocol? {get set}
}
protocol ModuleRouterProtocol {
    func createModule() -> UIViewController & ModuleViewProtocol
}
