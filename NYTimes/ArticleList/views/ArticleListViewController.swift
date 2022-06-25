//
//  ViewController.swift
//  NYTimes
//
//  Created by Avaneesh on 25/06/22.
//

import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // data source
     var viewModel = ArticlesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = viewModel;
        self.tableView.delegate = self;
        self.title = Strings.kArticleTitleString

    }

    override func viewDidAppear(_ animated: Bool) {
        self.activityIndicator.startAnimating();
        viewModel.loadData {
            self.tableView.reloadData();
            self.activityIndicator.stopAnimating()
        };
    }
    
    static func storyboardInstance() -> ArticleListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ArticleListViewController") as! ArticleListViewController
        return vc
    }
}

extension ArticleListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArticleDetailsViewController.storyboardInstance()
        vc.viewModel = ArticlesDetailsViewModel(article: viewModel.articleList[indexPath.row])
        self.show(vc, sender:   self)
    }
}

