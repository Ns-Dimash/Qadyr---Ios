import UIKit

class MainTabBar: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let vc1 = UINavigationController(rootViewController: TimeViewController())
        let vc2 = UINavigationController(rootViewController: TasbihViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "clock")
        vc2.tabBarItem.image = UIImage(systemName: "moon")
        tabBar.tintColor = .label
        
        vc1.title = "Time"
        vc2.title = "Tasbih"
        
        
        setViewControllers([vc1,vc2], animated: true)
        
    }
}

