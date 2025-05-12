import '../utils/size_fit.dart';

extension ExNumFit on num {
  get rpx {
    return SizeFit.setRpx(this);
  }

  get px {
    return SizeFit.setPx(this);
  }
}
