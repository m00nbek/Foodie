
import UIKit

// MARK: - View
class ModuleViewController: UIViewController, ModuleViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
		setupButtonTargets()
    }
    // MARK: - Properties
    var presenter: ModulePresenterProtocol?
    // MARK: - Selectors
	
	// Button targets
	private func setupButtonTargets() {
		
	}
    // MARK: - Functions
    private func setupUI() {

    }
}

// MARK: - Interactor
class ModuleInteractor: ModuleInteractorProtocol {
    weak var presenter: ModulePresenterProtocol?
}

// MARK: - Presenter
class ModulePresenter: ModulePresenterProtocol {
    weak var view: ModuleViewProtocol?
    var interactor: ModuleInteractorProtocol?
    var router: ModuleRouterProtocol?
}

// MARK: - Router
class ModuleRouter: ModuleRouterProtocol {
    static func createModule() -> UIViewController & ModuleViewProtocol {
        let view: UIViewController & ModuleViewProtocol = ModuleViewController()
        let interactor: ModuleInteractorProtocol = ModuleInteractor()
        let presenter: ModulePresenterProtocol = ModulePresenter()
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
protocol ModuleViewProtocol: AnyObject {
    var presenter: ModulePresenterProtocol? {get set}
}
protocol ModuleInteractorProtocol: AnyObject {
    var presenter: ModulePresenterProtocol? {get set}
}
protocol ModulePresenterProtocol: AnyObject {
    var view: ModuleViewProtocol? {get set}
    var interactor: ModuleInteractorProtocol? {get set}
    var router: ModuleRouterProtocol? {get set}
}
protocol ModuleRouterProtocol: AnyObject {
    static func createModule() -> UIViewController & ModuleViewProtocol
}
