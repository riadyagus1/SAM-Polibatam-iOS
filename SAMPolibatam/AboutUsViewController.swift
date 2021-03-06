//
//  AboutUsViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 23/02/21.
//

import UIKit

class AboutUsViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
                setupSlideScrollView(slides: slides)
                
                pageControl.numberOfPages = slides.count
                pageControl.currentPage = 0
                view.bringSubviewToFront(pageControl)

        // Do any additional setup after loading the view.
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    func createSlides() -> [Slide] {

            let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide1.imageView.image = UIImage(named: "Logo-Polibatam.png")
            slide1.imageViewApp.image = UIImage(named: "logo1.png")
            slide1.lblTitle.text = "APA ITU SAM POLIBATAM ?"
            slide1.lblDesc.text = "SAM Polibatam (Sistem Absensi Mobile)  merupakan sebuah aplikasi yg berfungsi bagi  para karyawan Politeknik Negeri Batam untuk  melakukan absensi. \n \n Dimana SAM dapat memudahkan karyawan Politeknik Negeri Batam untuk absen ataupun izin  hanya melalui ponsel masing-masing karyawan. Kami berharap SAM dapat berjalan sesuai keinginan."
            
            let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide2.imageHamdani.image = UIImage(named: "Pak Hamdani.png")
            slide2.lblNama.text = "Hamdani Arif, S.Pd., M.Sc."
            slide2.lblRole.text = "Manajer Proyek"
        
            slide2.imageAgus.image = UIImage(named: "Agus.png")
            slide2.lblNama2.text = "Agus Riady"
            slide2.lblRole2.text = "Anggota"
        
            slide2.imageTasya.image = UIImage(named: "Tasya.png")
            slide2.lblNama3.text = "Tasya Selvia Ulfa"
            slide2.lblRole3.text = "Anggota"
        
            slide2.imageKevin.image = UIImage(named: "Kevin.png")
            slide2.lblNama4.text = "Kevin Timoteus Sirait"
            slide2.lblRole4.text = "Anggota"
        
            slide2.imageRizky.image = UIImage(named: "Rizky.png")
            slide2.lblNama5.text = "Rizky Setiawan"
            slide2.lblRole5.text = "Anggota"
            
            return [slide1, slide2]
        }
    
    func setupSlideScrollView(slides : [Slide]) {
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(slides[i])
            }
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            
            /*
             * below code changes the background color of view on paging the scrollview
             */
    //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
            
        
            /*
             * below code scales the imageview on paging the scrollview
             */
            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
            if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
                
                slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
                slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
                
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
