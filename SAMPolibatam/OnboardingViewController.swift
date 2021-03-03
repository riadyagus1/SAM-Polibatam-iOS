//
//  OnboardingViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 24/02/21.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var Onboardings:[Onboarding] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        Onboardings = createOnboardings()
                setupOnboardingScrollView(Onboardings: Onboardings)
                
                pageControl.numberOfPages = Onboardings.count
                pageControl.currentPage = 0
                view.bringSubviewToFront(pageControl)

        // Do any additional setup after loading the view.
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    
    func createOnboardings() -> [Onboarding] {

            let Onboarding1:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
            Onboarding1.ImageOnboarding.image = UIImage(named: "logo1.png")
            Onboarding1.lblJudul.text = "Selamat Datang Di \n SAM Polibatam!"
            Onboarding1.lblDes.text = "Geser ke kiri untuk mempelajari \n lebih lanjut tentang fitur kami!"
        
            let Onboarding2:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
            Onboarding2.ImageOnboarding.image = UIImage(named: "onboarding1.png")
            Onboarding2.lblJudul.text = "Apa itu \n SAM Polibatam?"
            Onboarding2.lblDes.text = "SAM Polibatam (Sistem Absensi Mobile) merupakan sebuah aplikasi yg berfungsi bagi para karyawan Politeknik Negeri Batam untuk melakukan absensi."
            
            let Onboarding3:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
            Onboarding3.ImageOnboarding.image = UIImage(named: "onboarding2.png")
            Onboarding3.lblJudul.text = "Lakukan absensi melalui ponsel anda"
            Onboarding3.lblDes.text = "Klik Absen Masuk. \n \n Jika anda berada di areaPolibatam anda dapat langsung melakukan absensi. \n \n Selanjutnya ambil foto untuk verifikasi. \n \n Selesai."
            
            let Onboarding4:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
            Onboarding4.ImageOnboarding.image = UIImage(named: "onboarding3.png")
            Onboarding4.lblJudul.text = "Berhalangan hadir?"
            Onboarding4.lblDes.text = "Jika anda berhalangan hadir karena suatu hal, Silahkan klik tombol Izin yang terdapat pada Home Screen."
            
            let Onboarding5:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
            Onboarding5.ImageOnboarding.image = UIImage(named: "onboarding4.png")
            Onboarding5.lblJudul.text = "Melihat riwayat absensinya"
            Onboarding5.lblDes.text = "Terdapat fitur riwayat yang berisi tentang catatan kehadiran yang berhasil di catat sebelumnya. \n \n Anda dapat mengakses fitur ini melalui tab History."
            
        return [Onboarding1, Onboarding2, Onboarding3, Onboarding4, Onboarding5]
        }
    
    func setupOnboardingScrollView(Onboardings : [Onboarding]) {
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(Onboardings.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< Onboardings.count {
                Onboardings[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(Onboardings[i])
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
                
                Onboardings[0].ImageOnboarding.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
                Onboardings[1].ImageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
                
            } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
                Onboardings[1].ImageOnboarding.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
                Onboardings[2].ImageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
                
            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
                Onboardings[2].ImageOnboarding.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
                Onboardings[3].ImageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
                
            } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
                Onboardings[3].ImageOnboarding.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
                Onboardings[4].ImageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
                Onboardings[4].ImageOnboarding.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
                Onboardings[5].ImageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
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
