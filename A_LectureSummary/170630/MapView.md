# MapView

## A. 용어

***

• Region : 지역 (MKCoordinateRegion사용)<p>• Span : 펼쳐진 영역(zoom level) - (MKCoordinateSpan사용)<p>	- one degree of latitude is always approximately 111 kilometers<p>• Location Coordinate : 좌표<p>• latitude : 위도 (wgs84 좌표계 사용)<p>• longitude : 경도 (wgs84 좌표계 사용)
***

- Spen 부연설명: 지도는 이미지다. 확대하다보면 좀 더 디테일한 이미지로 바꾸어서 다시 로드해주는 것
	- Region이라는 한 화면에 10km까지 보여줄거야 또는 1km까지 보여줄거야 라는 방식으로 설정해서 이미지를 확대할 수도 있다.
- 위도와 경도로 좌표(Location Coordinate)를 만든다
- Span과 거리를 가지고 Region을 만든다.
- 지도를 움직이면 위도경도가 계속 바뀌는 것이고, 지도를 확대축소하면 Span이 바뀌는 것이다.

## B. Center 좌표 설정

```swift
let regionRadius: CLLocationDistance = 1000
let location = CLLocation(latitude: 37.515675, longitude: 127.021378)let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
mapView.setRegion(coordinateRegion, animated: true)
```

- latitude: 가로선 | longitute: 세로선
- Distance의 기준은 meter다. 

```swift
//setLocation Locationlet location = CLLocation(latitude: 37.515675, longitude: 127.021378)let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
mapView.setRegion(coordinateRegion, animated: true)
```

## C. Pin 추가 

***

• MKAnnotation Protocol을 사용하여 annotation 클래스 생성(NSObject 필수 상속)<p>• annotation 인스턴스 생성 후 Mapview에 Add
***

- annotation은 UI가 아니고, 데이터다.
- annotation View가 실질적으로 보인다.

```swift
public protocol MKAnnotation : NSObjectProtocol {	// Center latitude and longitude of the annotation view.	// The implementation of this property must be KVO compliant.	public var coordinate: CLLocationCoordinate2D { get }	// Title and subtitle for use by selection UI.	optional public var title: String? { get }	optional public var subtitle: String? { get }}
```

## D. MKMapViewDelegate

```swift
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {	if let annotation = annotation as? CustomAnnotation {		let identity = "pin"		var pinView: MKPinAnnotationView		if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity)			as? MKPinAnnotationView {			dequeuedView.annotation = annotation			pinView = dequeuedView		} else {			pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)			pinView.canShowCallout = true			pinView.calloutOffset = CGPoint(x: -5, y: 5)			pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView		}		return pinView	}	return nil}
func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,calloutAccessoryControlTapped control: UIControl) {	///callout Action}
```

## E. 사용자 위치 설정

***

**• 사용자 허용**<p>
1. info.plist 항목 추가 (택1) - ios 10 이상<p>- Privacy - Location When In Use Usage Description : YES<p>- Privacy - Location Always Usage Description : YES<p>
**• Location Manager 객체 생성** (CLLocationManager)<p>```swiftlet manager = CLLocationManager() //CL: CoreLocation
```
2. 현 위치 요청 인증<p>
- manager.requestAlwaysAuthorization()<p>- manager.requestWhenInUseAuthorization()<p>
3. 업데이트<p>
- manager.startUpdatingLocation()<p>- manager.stopUpdatingLocation()<p>

***

- 반드시 map과 써야하는 것은 아니다.
- 쓰려면 사용자에게 위치서비스 허용을 받아야 한다.

```swift
let manager = CLLocationManager()manager.delegate = selfmanager.requestAlwaysAuthorization()manager.requestWhenInUseAuthorization()manager.desiredAccuracy = kCLLocationAccuracyBestmanager.startUpdatingLocation()
mapView.showsUserLocation
```