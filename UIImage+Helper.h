//
//  UIImage+UIImage_Helper.h
//  MovementAnalyzer
//
//  Created by Bob de Graaf on 10-04-12.
//  Copyright (c) 2012 GraafICT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Helper)

+(UIImage *)imageNamed:(NSString *)name deviceSpecific:(BOOL)deviceSpecific extension:(NSString *)extension;
-(UIImage *)blurredImage:(CGFloat)blurAmount;
-(UIImage *)imageAtRect:(CGRect)rect;
-(UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
-(UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
-(UIImage *)imageByScalingToSize:(CGSize)targetSize;
-(UIImage *)imageRotatedByRadians:(CGFloat)radians;
-(UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end